defmodule ChallengeWeb.Router do
  use ChallengeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChallengeWeb do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: BankWeb.Schema

    forward "/", Absinthe.Plug,
      schema: BankWeb.Schema
  end
end
