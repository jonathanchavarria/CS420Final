defmodule ChirpWeb.UserLive.UserComponent do
  use ChirpWeb, :live_component

  def render(assigns) do
    ~H"""

    <div id={"user-#{@user.id}"} class="user">
      <div class = "profilepic">
            <img src={@user.profile_pic} width="150" height="150" />
      </div>
      <div class = "username">
           <%= @user.username %>
      </div>
      <div class = "bio">
           <%= @user.bio%>
      </div>
      <%= link to: "#", phx_click: "delete", phx_value_id: @user.id, data: [confirm: "Are you sure?"] do %>
      <span>❌</span>
    <% end %>
    </div>

    """

  end

  def handle_event("delete", _, socket) do
    {:noreply, socket}
  end
end
