# use latest Node image
FROM maven:3-jdk-7

# install App Engine SDK
ARG APPENGINE_SDK="appengine-java-sdk-1.9.42"
RUN curl -o /tmp/$APPENGINE_SDK.zip https://storage.googleapis.com/appengine-sdks/featured/$APPENGINE_SDK.zip
RUN apt-get -y update
RUN apt-get -y install unzip
RUN mkdir -p /usr/share/appengine-sdk
RUN unzip -q -d /usr/share/appengine-sdk/ /tmp/appengine-java-sdk-1.9.42.zip
ENV PATH "$PATH:/usr/share/appengine-sdk/$APPENGINE_SDK/bin"
RUN ln -s /usr/share/appengine-sdk/$APPENGINE_SDK/bin/appcfg.sh /usr/bin/appcfg.sh
CMD ["appcfg.sh]