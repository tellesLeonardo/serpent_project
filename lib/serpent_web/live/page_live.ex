defmodule SerpentWeb.PageLive do
  use SerpentWeb, :live_view
  alias Serpent.UtilsFunctions

  @impl true
  def mount(_params, session, socket) do
    current_user =
      session["user_token"]
      |> Serpent.Database.get_user_by_session_token

    {:ok,
    socket
    |> assign(current_user: current_user)
    |> assign(:uploaded_files, [])
    |> allow_upload(:post, accept: ~w(.jpg .jpeg), max_entries: 2)}
  end

  @impl true
  def handle_event("suggest", _val, socket) do
    {:noreply, socket}
  end

  def handle_event("save_file", val,socket) do
    IO.inspect(val,label: "save")

      consume_uploaded_entries(socket, :post, fn %{path: path}, _entry ->


        UtilsFunctions.send_objetc("uploadsfile", "#{Enum.random(1..10000000)}.jpeg",path)
      end)

    {:noreply, socket}
  end

  def handle_event("validate_file", val,socket) do
    IO.inspect(val,label: "vali")

    {:noreply, socket}
  end
end
