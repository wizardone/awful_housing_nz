FROM elixir:latest

WORKDIR /app

COPY . /app
COPY mix.exs /app/mix.exs

RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs
RUN apt-get -y install inotify-tools

RUN mix local.hex --force
RUN mix deps.get
