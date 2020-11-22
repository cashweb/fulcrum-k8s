FROM ubuntu:latest as download
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get -qq -y --no-install-recommends install curl ca-certificates
RUN curl -LO https://github.com/cculianu/Fulcrum/releases/download/v1.3.1/Fulcrum-1.3.1-x86_64-linux.tar.gz
RUN tar -zxf Fulcrum-1.3.1-x86_64-linux.tar.gz
RUN cp Fulcrum-1.3.1-x86_64-linux/Fulcrum /Fulcrum
RUN cp Fulcrum-1.3.1-x86_64-linux/FulcrumAdmin /FulcrumAdmin
FROM ubuntu:latest
COPY --from=download /Fulcrum /Fulcrum
COPY --from=download /FulcrumAdmin /FulcrumAdmin
ENTRYPOINT [ "/Fulcrum" ]
CMD ["/etc/fulcrum/fulcrum.conf"]
