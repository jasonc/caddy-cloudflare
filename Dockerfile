ARG CLOUDFLARE_DNS_REF=1bc23c92a08e0c38937c6cc28b461722471e78b9

FROM caddy:2-builder AS builder
ARG CLOUDFLARE_DNS_REF

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare=github.com/ogerman/cloudflare@${CLOUDFLARE_DNS_REF}

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
