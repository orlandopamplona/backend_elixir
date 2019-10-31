defmodule UsersAccountWeb.Router do
  use UsersAccountWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", UsersAccountWeb do
    pipe_through :api

    resources "/users",  UserController
    options "/users", UserController, :index

    resources "/users/find/",  UserController
    options "/users/find/:id", UserController, :show

    resources "/users/create",  UserController
    options "/users/create", UserController, :create

    resources "/users/delete/",  UserController
    options "/users/delete/:id", UserController, :delete
  end

end
