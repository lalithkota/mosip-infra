FROM python:3
WORKDIR  /opt/mosip
COPY keycloak_init.py .
ADD python-keycloak-plus.tgz .
COPY requirements.txt .
WORKDIR /opt/mosip/python-keycloak-plus
RUN python3 setup.py install
WORKDIR  /opt/mosip
RUN pip3 install -r requirements.txt
ENV KEYCLOAK_SERVER_URL=
ENV KEYCLOAK_ADMIN_USER=user
ENV KEYCLOAK_ADMIN_PASSWORD=
ENV INPUT_DIR=/opt/mosip/input
WORKDIR  $INPUT_DIR
WORKDIR  /opt/mosip
CMD python3 keycloak_init.py $KEYCLOAK_SERVER_URL $KEYCLOAK_ADMIN_USER $KEYCLOAK_ADMIN_PASSWORD $INPUT_DIR/input.yaml 

