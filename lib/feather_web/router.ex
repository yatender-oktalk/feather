defmodule Feather.Router do
  use FeatherWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Feather do
    pipe_through :api
    forward "/promo", PromoRouter
  end
end
 