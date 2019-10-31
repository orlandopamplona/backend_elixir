defmodule UsersAccountWeb.UserController do
  use UsersAccountWeb, :controller

  alias UsersAccount.Management
  alias UsersAccount.Management.User
  alias UsersAccount.{ Email, Mailer }

  action_fallback UsersAccountWeb.FallbackController

  def send_welcome_email(email_address, account_name) do
    Email.welcome_email(email_address, account_name)
    |> Mailer.deliver_now()
  end

  def index(conn, _params) do
    users = Management.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    send_welcome_email(user_params["mail"], user_params["name"])
    with {:ok, %User{} = user} <- Management.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Management.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Management.get_user!(id)

    with {:ok, %User{} = user} <- Management.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Management.get_user!(id)

    with {:ok, %User{}} <- Management.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

end
