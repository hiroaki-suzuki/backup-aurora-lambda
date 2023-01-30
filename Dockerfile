FROM --platform=linux/amd64 public.ecr.aws/lambda/provided:al2.2023.01.11.06

RUN yum install -y gzip mariadb awscli jq && \
  yum clean all && rm -rf /var/cache/yum

COPY src/bootstrap ${LAMBDA_RUNTIME_DIR}
COPY src/function.sh ${LAMBDA_TASK_ROOT}

CMD [ "function.handler" ]
