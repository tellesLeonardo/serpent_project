defmodule SerpentWeb.UserRegistrationController do
  use SerpentWeb, :controller

  alias Serpent.Database
  alias Serpent.Database.User
  alias SerpentWeb.UserAuth

  def new(conn, _params) do
    changeset = Database.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    IO.puts "teste aqui"
    case Database.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Database.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :confirm, &1)
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
