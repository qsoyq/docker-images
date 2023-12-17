FROM debian:12

RUN apt-get update && apt-get install curl -y

RUN curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/download/2023.10.0/cloudflared-linux-arm64.deb && \
    dpkg -i cloudflared.deb

CMD bash
