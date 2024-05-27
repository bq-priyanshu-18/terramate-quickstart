FROM loadimpact/k6:latest AS k6official
FROM docker:23.0.6 

COPY --from=k6official /usr/bin/k6 /usr/bin/k6
RUN apk update && apk upgrade
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN apk add --no-cache make gcc g++ libc6-compat bash
RUN apk add -U curl nodejs yarn npm git zip gnupg dpkg

## python 3
RUN apk add python3 && ln -sf python3 /usr/bin/python
RUN curl -fsSL https://get.pulumi.com/ | sh

# Download and install Terraform
RUN curl -fsSL https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform.zip
    
#Install Doppler
RUN (curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sh 

ENV PATH="/root/.pulumi/bin:${PATH}"

# Second stage: use the terramate image
FROM ghcr.io/terramate-io/terramate:0.8.4 AS terramate

# Run terramate command to check the version
RUN terramate --version
# Set entry point for interactive access
ENTRYPOINT ["/bin/bash"]