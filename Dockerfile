FROM node:16-alpine AS builder
ARG SSB_VER=v16.0.1
ENV PYTHONUNBUFFERED=1
ENV npm_config_package_lock=true
RUN apk add --update --no-cache python3 make g++ git && ln -sf python3 /usr/bin/python
RUN npm install -g npm node-gyp
RUN git clone https://github.com/ssbc/ssb-server.git /build && cd /build && git checkout tags/$SSB_VER
WORKDIR /build
RUN npm install sodium-native --save
RUN npm install && npm dedupe && npm shrinkwrap && npm audit fix || exit 0

FROM node:16-alpine
COPY --from=builder /build/ /app/
RUN npm install -g pm2 && npm install -g /app/
WORKDIR /app
CMD pm2-runtime 'npm start' -n ssb-server
EXPOSE 8008/tcp