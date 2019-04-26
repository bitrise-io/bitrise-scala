from bitriseio/docker-bitrise-base

RUN apt-get update && \
 add-apt-repository ppa:openjdk-r/ppa && \
 echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
 apt-get update && \
 apt-get install -y --no-install-recommends sbt openjdk-11-jdk && \
 wget www.scala-lang.org/files/archive/scala-2.11.8.deb && \
 dpkg -i scala-2.11.8.deb && \
 rm *.deb && \
 apt-get clean
