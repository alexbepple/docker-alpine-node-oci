FROM mhart/alpine-node:4.4.7

RUN apk add --no-cache python libaio make g++

RUN mkdir -p /opt/oracle
WORKDIR /opt/oracle
COPY instantclient_12_1 instantclient
WORKDIR /opt/oracle/instantclient
RUN ln -s libclntsh.so.12.1 libclntsh.so

# OCI_LIB_DIR and OCI_INC_DIR need not be set as we install Instant Client into the default location
# cp. https://github.com/oracle/node-oracledb/blob/master/INSTALL.md#instzip

#RUN npm install oracledb@1.11

