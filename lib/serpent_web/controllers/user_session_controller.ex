defmodule SerpentWeb.UserSessionController do
  use SerpentWeb, :controller

  alias Serpent.Database
  alias SerpentWeb.UserAuth

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"user" => user_params}) do
    IO.puts "user user"
    %{"email" => email, "password" => password} = user_params

    if user = Database.get_user_by_email_and_password(email, password) do
      user |> IO.inspect(label: "user vendi direto do banco")
      UserAuth.log_in_user(conn, user, user_params)
    else
      render(conn, "new.html", error_message: "Invalid email or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
