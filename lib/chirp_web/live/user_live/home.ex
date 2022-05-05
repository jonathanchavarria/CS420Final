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
    ~H"""

    <div class = "user">
    <%= for user <- @users do %>
       <img src={Enum.at(user.photos,0)} width="40" height="40" />
    <% end %>
    </div>


    """


  end

  defp list_users do
    Accounts.list_users()
  end
end
