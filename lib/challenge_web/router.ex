defmodule ChallengeWeb.Router do
  use ChallengeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ChallengeWeb.Schema,
      interface: :simple,
      context: %{pubsub: ChallengeWeb.Endpoint}
  end
end
