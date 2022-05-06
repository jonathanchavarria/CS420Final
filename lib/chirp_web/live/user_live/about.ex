defmodule ChirpWeb.PageLive.Home do
  use ChirpWeb, :live_view

  def render(assigns) do
    ~H"""

    <div id = "boxjeff">
        <div class = "aboutTitlejeff">
            <h1 class = "wordsTitlejeff">ABOUT</h1>
        </div>
        <div class = "textboxjeff">
            <p class = "wordsjeff">Vibe Has <i>RELATIONSHIPS...</i></p>
            <p class = "infoj">Users Can:</p>
            <ul class = "infoj">
              <li>- Make New Connections</li>
              <li>- Visualize Social Circle</li>
              <li>- Post Images and Express Oneself</li>
            </ul>
            <p class = "infoj">Getting Started:</p>
            <ul class = "infoj">
              <li>- Click Sign Up</li>
              <li>- Enter Your Desired Name, Username, Bio, and Photos</li>
              <li>- Congrats, your account is made!!</li>
              <li>- Continue to explore the Home Page and Friend Map!</li>
            </ul>
            <p class = "infoj">QUESTIONS?</p>
            <ul class = "infoj">
              <li>Email jeffreycarson@nevada.unr.edu or</li>
              <li>jchavarria@nevada.unr.edu for help!</li>
            </ul>
        </div>
    </div>


    """


  end
end
