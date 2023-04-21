FROM ubuntu:23.04
RUN mkdir /app
WORKDIR /app
ENV MIX_ENV=prod

COPY _build/prod/rel/elixir_example .

CMD ["/app/bin/elixir_example", "start"]
