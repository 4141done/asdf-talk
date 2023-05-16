# Javascript Example
This application exposes a simple endpoint at `localhost:9000` for the purpose of demonstrating `asdf` usage in dev, CD, and production. 

## Example Usage
To run this locally:
```bash
asdf install
```

```bash
node index.js
```

## Docker Build
To just build the image outside of the context of a CI tool like Github Actions, we leverage a small bash script to inject anything defined in the local `.tool-versions` file as docker build args.

```bash
docker build $(./scripts/asdf_to_build_args.sh) -t js_example:0.0.1 .
```

```bash
docker run --rm -p 9000:9000 js_example:0.0.1
```
