#image ubuntu 16
FROM ubuntu:16.04

#jdk, maven, lib, git
RUN apt-get update \
&& apt-get install -y openjdk-8-jdk \
&& apt-get install -y maven \
&& apt-get install -f libpng16-16 \
&& apt-get install -f libjasper1 \
&& apt-get install -f -y libdc1394-22 \
&& apt-get install -y git

#app
RUN git clone https://github.com/barais/TPDockerSampleApp

WORKDIR /TPDockerSampleApp/

#install
RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar \
     -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar

RUN mvn package

#lance l'app
CMD java -Djava.library.path=lib/ -jar target/fatjar-0.0.1-SNAPSHOT.jar

#docker build -t tp1tlc .
#docker run -d -p 8080:8080 tp1tlc