ARG NODEJS_VERSION
FROM node:${NODEJS_VERSION}-bullseye-slim
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init
ENV NODE_ENV production

WORKDIR /usr/src/app
COPY ./ .
RUN npm ci --only=production

USER node
EXPOSE 9000
CMD ["dumb-init", "node", "index.js"]
