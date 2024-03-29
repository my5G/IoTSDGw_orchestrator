FROM my5gcore/base:latest AS builder
FROM alpine:3.8

LABEL description="My5Gcore open source 5G Core Network" \
    version="Stage 3"

ENV My5GC_MODULE udm
ARG DEBUG_TOOLS

# Install debug tools ~ 100MB (if DEBUG_TOOLS is set to true)
RUN if [ "$DEBUG_TOOLS" = "true" ] ; then apk add -U tcpdump vim strace net-tools curl netcat-openbsd ; fi

# Set working dir
WORKDIR /my5Gcore
RUN mkdir -p config/ log/ support/TLS/ ${My5GC_MODULE}/

# Copy executable and default certs
COPY --from=builder /my5Gcore/${My5GC_MODULE} ./${My5GC_MODULE}
COPY --from=builder /my5Gcore/support/TLS/${My5GC_MODULE}.pem ./support/TLS/
COPY --from=builder /my5Gcore/support/TLS/${My5GC_MODULE}.key ./support/TLS/

# Move to the binary path
WORKDIR /my5Gcore/${My5GC_MODULE}

# Config files volume
VOLUME [ "/my5Gcore/config" ]

# Certificates (if not using default) volume
VOLUME [ "/my5Gcore/support/TLS" ]

# Exposed ports
EXPOSE 29503
