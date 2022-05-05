defmodule ChirpWeb.UserLive.FormComponent do
  use ChirpWeb, :live_component

  alias Chirp.Accounts
  alias Chirp.Accounts.User

  @impl true
  def mount(socket) do
    {:ok,
      socket
      |> allow_upload(:photo, accept: ~w(.png .jpeg .jpg), max_entries: 1)
      |> allow_upload(:image, accept: ~w(.png .jpeg .jpg), max_entries: 10)
      }
  end


  @impl true
  def update(%{user: user} = assigns, socket) do
    changeset = Accounts.change_user(user)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      socket.assigns.user
      |> Accounts.change_user(user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    save_user(socket, socket.assigns.action, user_params)
  end

  def handle_event("cancel-entry", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :photo, ref)}
  end

  defp save_user(socket, :edit, user_params) do
    user = put_photo_urls(socket, socket.assigns.user)

    case Accounts.update_user(user, user_params, &consume_photos(socket, &1)) do
      {:ok, _user} ->
        {:noreply,
         socket
         |> put_flash(:info, "User updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_user(socket, :new, user_params) do
    user = put_photo_urls(socket, %User{})
    case Accounts.create_user(user, user_params, &consume_photos(socket, &1)) do
      {:ok, user} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_redirect(to: Routes.user_show_path(socket, :show, user))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset, params: user_params)}

    end
  end
  @spec ext(atom | %{:client_type => binary, optional(any) => any}) :: binary
  def ext(entry) do
    [ext | _] = MIME.extensions(entry.client_type)
    ext
  end

  defp put_photo_urls(socket, %User{} = user) do
    {completed, []} = uploaded_entries(socket, :photo)
    urls =
      for entry <- completed do
        Routes.static_path(socket, "/uploads/#{entry.uuid}.#{ext(entry)}")
      end
    {completed, []} = uploaded_entries(socket, :image)

    pageurls =
      for entry <- completed do
        Routes.static_path(socket, "/uploads/#{entry.uuid}.#{ext(entry)}")
      end

    %User{user | profile_pic: urls, photos: pageurls}

  end


  def consume_photos(socket, %User{} = user) do
    consume_uploaded_entries(socket, :photo, fn meta, entry ->
      dest = Path.join("priv/static/uploads", "#{entry.uuid}.#{ext(entry)}")
      File.cp!(meta.path, dest)

    end)

    consume_uploaded_entries(socket, :image, fn meta, entry ->
      dest = Path.join("priv/static/uploads", "#{entry.uuid}.#{ext(entry)}")
      File.cp!(meta.path, dest)

    end)
    {:ok, user}
  end
end
