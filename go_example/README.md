# Go Example
This application exposes a simple endpoint at `localhost:8000/hello` for the purpose of demonstrating `asdf` usage in dev, CD, and production. 

## Example Usage
To run this locally:
```bash
asdf install
```

```bash
go run cmd/simple-service/main.go
```

## Docker Build
To just build the image outside of the context of a CI tool like Github Actions, we leverage a small bash script to inject anything defined in the local `.tool-versions` file as docker build args.

```bash
docker build $(./priv/asdf_to_build_args.sh) -t go_example:0.0.1 .
```

```bash
docker run --rm -it -p 8000:8000 go_example:0.0.1
```
