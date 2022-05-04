defmodule ChirpWeb.UserLive.UserComponent do
  use ChirpWeb, :live_component

  def render(assigns) do
    ~H"""
      <div id={"user-#{@user.id}"} class= "user">

        <div class = "flex">
          <div class="box">
            <img src={@user.profile_pic} width="150" height="150" />
          </div>
          <div class="box">
            <div class = "fullname">
            <%= @user.full_name %>
            </div>

            <div class = "username">
            @<%= @user.username %>
            </div>

            <div class = "bio">
            <%= @user.bio %>
            </div>
          </div>
          <div class="box">
            <div class = "settings">
            Accept Friendships
            </div>
            <div class = "settings">
            View Map
            </div>
            <div class = "settings">
            Settings
            </div>
          </div>

        </div>
        <div class="flex2">
          <div class = "photos">
            <%= for image <- @user.photos do %>
              <img src={image} width="150" height="150" />
            <% end %>
          </div>
        </div>
      </div>


    """


  end

  def handle_event("delete", _, socket) do
    {:noreply, socket}
  end
end
