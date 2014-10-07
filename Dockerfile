FROM tutum/slate
RUN apt-get update && apt-get install -yq awscli

ADD publish.sh /app/publish.sh
RUN chmod +x /app/publish.sh

ENV PATH $PATH:/app
ENV AWS_ACCESS_KEY_ID **setme**
ENV AWS_SECRET_ACCESS_KEY **setme**
ENV BUCKET s3://docs.tutum.co/v2/api/