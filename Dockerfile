FROM loadimpact/k6:latest AS k6official
FROM docker:23.0.6 

COPY --from=k6official /usr/bin/k6 /usr/bin/k6
RUN apk update && apk upgrade
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN apk add --no-cache make gcc g++ libc6-compat bash
# Install essential tools and dependencies
RUN apk add --no-cache make gcc g++ libc6-compat bash curl nodejs yarn npm git zip gnupg python3

## python 3
RUN apk add python3 && ln -sf python3 /usr/bin/python
RUN curl -fsSL https://get.pulumi.com/ | sh

#Install Doppler
RUN (curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sh 

RUN curl -fsSL https://github.com/terramate-io/terramate/releases/download/v0.9.0-rc1/terramate_0.9.0-rc1_linux_amd64.deb -o /usr/local/bin/terramate \
    && chmod +x /usr/local/bin/terramate

# Set Pulumi binary path
ENV PATH="/root/.pulumi/bin:${PATH}"

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]
