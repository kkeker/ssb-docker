# SSB-Server Docker builder


This project builds a Docker image from the famous [SSB-server project](https://github.com/ssbc/ssb-server) for the [decentralized social network Scuttlebutt](https://scuttlebutt.nz).

All documentation about [SSB](https://ssbc.github.io) and [Scuttlebutt](https://scuttlebutt.nz/docs/) is available on their official websites.

During the image build process, the `ssb-server` command is added to the global console settings, so you can call it by going inside the image `docker exec -ti {image_id} sh` or using `docker exec -ti {image_id} ssb-server whoami`.

Use `docker run -d -v $PWD/config:/root/.ssb/config:ro ssb-server:latest` to mount the [configuration file](https://github.com/ssbc/ssb-config) to the image.


**TODO:**

Run ssb-server as non-root user.
[This documentation](https://github.com/keymetrics/docker-pm2/issues/21) is not suitable for pm2.
