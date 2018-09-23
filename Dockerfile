FROM elixir:latest

WORKDIR /app

COPY . /app
COPY mix.exs /app/mix.exs

RUN mix local.hex --force
RUN mix deps.get

CMD ["mix", "phx.server"]
