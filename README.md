# grimm-docker
Dockerfile for grimm node and grimm wallet

- We expose grimm-node at port 10000, and wallet-api at 10001
- After initial run
  - Generated `seed_phrase` and first address is at `data/wallet/init.txt`
  - Encrypted wallet is at `data/wallet/wallet.db`
  - Wallet pass is `word`

## Build

```
docker build -t grimm .
```

## Run

```
mkdir data
docker run --rm -itd --name igrimm -p 10000:10000 -p 10001:10001 -v `pwd`/data:/opt/coin grimm
```

## Using pre-built docker image

Using automated build image from <https://hub.docker.com/r/mixhq/grimm/>:

```
docker run --rm -itd --name igrimm -p 10000:10000 -p 10001:10001 -v `pwd`/data:/opt/coin mixhq/grimm
```
