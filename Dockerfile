FROM --platform=linux/amd64 public.ecr.aws/lambda/provided:al2.2023.01.11.06

RUN yum install -y gzip awscli jq yum-utils && \
  yum -y install https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm && \
  rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022 && \
  yum-config-manager --disable mysql80-community && \
  yum-config-manager --enable mysql57-community && \
  yum install -y mysql-community-client && \
  yum clean all && rm -rf /var/cache/yum

COPY src/bootstrap ${LAMBDA_RUNTIME_DIR}
COPY src/function.sh ${LAMBDA_TASK_ROOT}

CMD [ "function.handler" ]
