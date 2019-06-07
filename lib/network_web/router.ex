defmodule NetworkWeb.Router do
  use NetworkWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Network.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NetworkWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/login", PageController, :login
    get "/gifts", GiftController, :index
    delete "/gifts", GiftController, :delete

    resources "/contacts", ContactController

    
  end

  scope "/auth", NetworkWeb do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", NetworkWeb do
  #   pipe_through :api
  # end
end
