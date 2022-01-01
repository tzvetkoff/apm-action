FROM ubuntu:hirsute

ENV PATH=/home/node/.npm/bin:$PATH
ENV DEBIAN_FRONTEND=noninteractive

COPY "entrypoint.sh" "/home/node/entrypoint.sh"

RUN chmod 0755 /home/node/entrypoint.sh
RUN useradd -m node && chown -R node:node /home/node
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential curl pkgconf libsecret-1-dev
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm config set -g prefix /home/node/.npm
RUN su node -c 'npm install -g atom-package-manager'

USER node
WORKDIR /home/node
ENTRYPOINT ["/home/node/entrypoint.sh"]
