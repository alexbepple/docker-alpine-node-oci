FROM mhart/alpine-node:4.4.7


RUN mkdir -p /opt/oracle
WORKDIR /opt/oracle
COPY instantclient_12_1 instantclient
WORKDIR /opt/oracle/instantclient
RUN ln -s libclntsh.so.12.1 libclntsh.so

# OCI_LIB_DIR and OCI_INC_DIR need not be set as we install Instant Client into the default location
# cp. https://github.com/oracle/node-oracledb/blob/master/INSTALL.md#instzip

RUN apk add --no-cache --virtual .build-deps python libaio make g++ \
    && npm install oracledb@1.11 \
    && apk del .build-deps

