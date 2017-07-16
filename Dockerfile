FROM centos7

RUN yum update -y \
    && yum install -y epel-release initscripts \
    && yum install nginx \
    && yum install -y R

## this is where we run an R script to install R packages

RUN cd /tmp \
    && curl -O https://download2.rstudio.org/rstudio-server-rhel-1.0.143-x86_64.rpm \
    && yum install -y --nogpgcheck rstudio-server-rhel-1.0.143-x86_64.rpm \
    && rm rstudio-server-rhel-1.0.143-x86_64.rpm

COPY rserver.conf /etc/rstudio/rserver.conf
