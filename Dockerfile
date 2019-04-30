from bitriseio/docker-bitrise-base

RUN apt-get update && \
 add-apt-repository ppa:openjdk-r/ppa && \
 echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
 export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
 echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
 curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
 apt-get update && \
 apt-get install -y --no-install-recommends sbt openjdk-11-jdk google-cloud-sdk && \
 wget www.scala-lang.org/files/archive/scala-2.11.8.deb && \
 dpkg -i scala-2.11.8.deb && \
 rm *.deb && \
 apt-get clean

RUN /usr/bin/printf '\xfe\xed\xfe\xed\x00\x00\x00\x02\x00\x00\x00\x00\xe2\x68\x6e\x45\xfb\x43\xdf\xa4\xd9\x92\xdd\x41\xce\xb6\xb2\x1c\x63\x30\xd7\x92' > /etc/ssl/certs/java/cacerts && \
 /var/lib/dpkg/info/ca-certificates-java.postinst configure

RUN export VERSION=1.5.0 && \
 export OS=linux && \
 export ARCH=amd64 && \
 curl -fsSL "https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/download/v${VERSION}/docker-credential-gcr_${OS}_${ARCH}-${VERSION}.tar.gz"  | tar xz --to-stdout ./docker-credential-gcr  > /usr/bin/docker-credential-gcr && chmod +x /usr/bin/docker-credential-gcr
