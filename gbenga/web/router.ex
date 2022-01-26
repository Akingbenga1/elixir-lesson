defmodule Gbenga.Router do
  use Gbenga.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Gbenga.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Gbenga do
    pipe_through :browser # Use the default browser stacks

    get "/", TopicController, :index
    get "/topics/new", TopicController, :new
    post "/topics", TopicController, :create
    get "/topics/:id/edit", TopicController, :edit
    put "/topics/:id", TopicController, :update
    delete "/topics/:id", TopicController, :delete
  end

  scope "/auth", Gbenga do
    pipe_through :browser # Use the default browser stacks

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", Gbenga do
  #   pipe_through :api
  # end
end
