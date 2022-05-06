defmodule ChirpWeb.PageLive.Home do
  use ChirpWeb, :live_view

  def render(assigns) do
    ~H"""

    <div id = "boxjeff">
        <div class = "aboutTitlejeff">
            <h1 class = "wordsjeff">ABOUT</h1>
        </div>
        <div class = "textboxjeff">
            <p class = "wordsjeff">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Deleniti vitae eligendi quia ipsum voluptatibus fugiat ut sint veritatis repellendus quasi. Fugiat, dolor, fugit maiores vero nostrum earum exercitationem, ut animi dolore vel totam? Facere, voluptatum quaerat. Ratione inventore dolorum culpa mollitia rerum. Accusantium, mollitia. Ipsum facilis a enim tempore molestiae.</p>
        </div>
    </div>


    """


  end
end
