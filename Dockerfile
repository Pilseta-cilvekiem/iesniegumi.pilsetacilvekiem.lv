FROM elixir:1.9.1-alpine

WORKDIR /app

COPY assets assets
COPY mix.exs .

RUN apk add --no-cache bash git openssh nodejs npm

RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.get

RUN cd assets && npm install

# RUN mix ecto.create
# RUN mix ecto.migrate

# RUN mix test

ENTRYPOINT mix phx.server