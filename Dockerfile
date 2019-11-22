FROM ubuntu:18.04

WORKDIR /opt
VOLUME /opt/coin
EXPOSE 10000 10001

RUN apt-get update && apt-get install -y wget xz-utils libboost-all-dev

RUN wget https://github.com/freenetcoder/grimm/releases/download/10.1dev1/Linux_grimm_node.tar.xz -O - | tar xJf -
RUN wget https://github.com/freenetcoder/grimm/releases/download/10.1dev1/Linux_wallet_api.tar.xz -O - | tar xJf -
RUN wget https://github.com/freenetcoder/grimm/releases/download/10.1dev1/Linux_grimm_wallet_cli.tar.xz -O - | tar xJf -

RUN rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /opt/
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
