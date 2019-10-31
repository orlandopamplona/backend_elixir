defmodule UsersAccountWeb.PageController do
  use UsersAccountWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
