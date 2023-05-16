FROM rust:1.68.2-slim AS build
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:stable-slim
WORKDIR /app
RUN apt-get update \
    && apt-get install -y dumb-init \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/target/release/rust_example ./
EXPOSE 7000
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/app/rust_example"]
