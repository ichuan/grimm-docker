#!/usr/bin/env bash

set -e

mkdir -p /opt/coin/wallet

if test $# -eq 0; then
  # generate wallet db if needed
  [ ! -f /opt/coin/wallet/wallet.db ] && {
    echo "Generating wallet at /opt/coin/wallet/init.txt ..."
    /opt/grimm-wallet --wallet_path /opt/coin/wallet/wallet.db \
      --pass word \
      --command init | tee /opt/coin/wallet/init.txt
  }
  # start node
  /opt/grimm-node --storage /opt/coin/node.db --port 10000 2>&1 &
  # wallet api
  exec /opt/wallet-api --port 10001 \
    --node_addr 127.0.0.1:10000 \
    --wallet_path /opt/coin/wallet/wallet.db \
    --pass word
else
  exec $@
fi