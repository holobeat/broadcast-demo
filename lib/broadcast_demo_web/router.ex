defmodule BroadcastDemoWeb.Router do
  use BroadcastDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BroadcastDemoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BroadcastDemoWeb do
    pipe_through :browser

    get "/", PageController, :home
    live "/demo", DemoLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", BroadcastDemoWeb do
  #   pipe_through :api
  # end
end
