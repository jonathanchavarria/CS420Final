defmodule ChirpWeb.UserLive.Home do
  use ChirpWeb, :live_view
  alias Chirp.Accounts
  alias Chirp.Accounts.User

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :users, list_users())}
  end

  @impl true
  def render(assigns) do
    IO.inspect(assigns)
    ~H"""

    <div class = "user">
      <div class="flex2">
        <div class = "photos">
          <%= for user <- @users do %>
            <%= Enum.at(user.photos,0)
                |> img_tag(class: "friendpics")
                |> link(to: Routes.user_show_path(assigns.socket, :show, user)) %>
            <% end %>
        </div>
      </div>
    </div>

    """


  end

  defp list_users do
    Accounts.list_users()
  end
end
