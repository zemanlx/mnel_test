FROM alpine:3.12

ARG SHFMT_VERSION=3.1.2

RUN wget -qO /bin/shfmt \
    "https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_linux_amd64" \
    && chmod a+x /bin/shfmt

ENTRYPOINT [ "/bin/shfmt" ]
