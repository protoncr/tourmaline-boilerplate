FROM crystallang/crystal:0.34.0

ADD . /src
WORKDIR /src

RUN shards build --release

CMD ["./bin/bot"]