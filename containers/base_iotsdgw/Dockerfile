FROM golang:1.14.4-stretch AS builder

LABEL maintainer="My5Gcore <support@m5gcore.labora.inf.ufg.br>"

ENV MY5GC_BRANCH master

ENV UE_BRANCH scenary3
#ENV UE_BRANCH free5gc-3.0.5-Version

#dependencies
RUN apt-get update
RUN apt-get -y install git gcc cmake autoconf libtool pkg-config libmnl-dev libyaml-dev ssh curl
RUN apt-get clean

# Get My5Gcore
RUN cd $GOPATH/src \
    && git clone --recursive -b ${MY5GC_BRANCH} -j 33 https://github.com/my5G/my5G-core.git my5Gcore

# Get UE Code
RUN cd $GOPATH/src/my5Gcore \
    && git clone -b ${UE_BRANCH} https://github.com/my5G/my5G-non3GPP-access.git ue \
    && go get -u github.com/calee0219/fatal

# Build UE
RUN cd $GOPATH/src/my5Gcore/ue/src \
    && CGO_ENABLED=0 go build -a -installsuffix nocgo -o ../bin/ue -x ue/ue.go

### Make IoTSDgw Forwarder

FROM golang:1.13-alpine AS builder2

ENV CGO_ENABLED=0
#ENV GO_EXTRA_BUILD_ARGS="-a -installsuffix cgo"

# Install dependecies
RUN apk add --no-cache ca-certificates tzdata make git

# Get  IoTSDgw Code
RUN cd $GOPATH/src/ \
    && git clone https://github.com/my5G/my5G-non3GPP-IoTSDGw.git non3GPP-IoTSDGw-Forwarder

#Compiling iotsdgw code
RUN cd $GOPATH/src/non3GPP-IoTSDGw-Forwarder \
    && make

#RUN make
RUN cd $GOPATH/src/non3GPP-IoTSDGw-Forwarder/simulator \
    && CGO_ENABLED=0 go build -a -installsuffix nocgo -o ../build/simulator simulator.go

# Alpine is used for debug purpose. You can use scratch for a smaller footprint.
FROM alpine

WORKDIR /my5gcore
RUN mkdir -p config/ support/TLS/

# Copy executables
COPY --from=builder /go/src/my5Gcore/ue/bin/* ./
COPY --from=builder2 /go/src/non3GPP-IoTSDGw-Forwarder/build/* ./

# Copy configuration files (not used for now)
COPY --from=builder /go/src/my5Gcore/config/* ./config/

# Copy default certificates (not used for now)
COPY --from=builder /go/src/my5Gcore/support/TLS/* ./support/TLS/