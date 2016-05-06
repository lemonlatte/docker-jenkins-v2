FROM ubuntu
MAINTAINER Jim Yeh <lemonlatte@gmail.com>

RUN apt-get -yqq update
RUN apt-get -yqq install wget openjdk-8-jre-headless default-jdk ttf-dejavu

RUN wget http://pkg.jenkins-ci.org/debian-rc/binary/jenkins_2.0_all.deb -O /tmp/jenkins_v2.deb
RUN apt-get -yqq install net-tools daemon
RUN dpkg -i /tmp/jenkins_v2.deb

# Clean apt cache files
RUN apt-get clean -qqy

# Fix timezone in container
RUN echo "Asia/Taipei" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

CMD ["su", "jenkins", "-c", "java -jar /usr/share/jenkins/jenkins.war"]
