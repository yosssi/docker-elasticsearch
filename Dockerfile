# Elasticsearch
#
# VERSION 1.0

# Use the ubuntu base image provided by dotColud.
FROM ubuntu

MAINTAINER Keiji Yoshida, yoshida.keiji.84@gmail.com

# Update the package lists.
RUN apt-get update

# Install curl.
RUN apt-get install -y curl

# Download Java.
RUN curl -o /usr/local/lib/jre-7u51-linux-x64.tar.gz https://s3-ap-northeast-1.amazonaws.com/yosssi/java/jre-7u51-linux-x64.gz

# Install Java.
RUN tar xvfz /usr/local/lib/jre-7u51-linux-x64.tar.gz -C /usr/local/lib
RUN rm /usr/local/lib/jre-7u51-linux-x64.tar.gz
ENV JAVA_HOME /usr/local/lib/jre1.7.0_51

# Download Elasticsearch.
RUN curl -o /usr/local/lib/elasticsearch-0.90.11.tar.gz https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.11.tar.gz

# Install Elasticsearch
RUN tar xvfz /usr/local/lib/elasticsearch-0.90.11.tar.gz -C /usr/local/lib
RUN rm /usr/local/lib/elasticsearch-0.90.11.tar.gz
ENV PATH $PATH:/usr/local/lib/elasticsearch-0.90.11/bin

# Launch Elasticsearch
ENTRYPOINT elasticsearch -f

# Expose Elasticsearch port
EXPOSE 9200
