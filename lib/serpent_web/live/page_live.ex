defmodule SerpentWeb.PageLive do
  use SerpentWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    current_user =
      session["user_token"]
      |> Serpent.Database.get_user_by_session_token

    {:ok, assign(socket, current_user: current_user)}
  end

  @impl true
  def handle_event("suggest", _val, socket) do
    {:noreply, socket}
  end
end
