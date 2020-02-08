FROM alpine:latest

RUN apk add curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.2/bin/linux/arm/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin

ADD kubectl-init.sh /usr/local/bin 
RUN chmod +x /usr/local/bin/kubectl-init.sh

ENTRYPOINT [ "kubectl" ]
CMD [ "--help" ]


