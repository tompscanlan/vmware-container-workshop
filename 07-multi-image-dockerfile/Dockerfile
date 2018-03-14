FROM ubuntu AS builder
RUN apt-get update
RUN apt-get install -y build-essential
COPY hello.c /
RUN make hello
FROM ubuntu
COPY --from=builder /hello /hello
CMD /hello
