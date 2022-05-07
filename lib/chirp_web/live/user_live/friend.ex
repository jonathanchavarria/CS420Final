defmodule ChirpWeb.PageLive.Friend do
  use ChirpWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex">
    <img class = "friend" src= "/images/bruh.png"  />
    </div>
    """


  end
end
