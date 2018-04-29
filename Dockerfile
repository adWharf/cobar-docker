FROM openjdk:9-jdk-slim
ENV COBAR_VERSION=1.2.7
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/alibaba/cobar/releases/download/v${COBAR_VERSION}/cobar-server-${COBAR_VERSION}.tar.gz && \
    mkdir /opt/cobar && \
    tar -zxvf cobar-server-${COBAR_VERSION}.tar.gz -C /opt/cobar && \
    rm cobar-server-${COBAR_VERSION}.tar.gz && \
    cd /opt/cobar

WORKDIR /opt/cobar

VOLUME /opt/cobar/conf

CMD ["./startup.sh"]