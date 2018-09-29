FROM ubuntu:18.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apt-utils vim gnupg ca-certificates curl wget locales && \
    echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0x51716619e084dab9 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y file git libapparmor1 psmisc libedit2 sudo lsb-release distro-info-data openssl multiarch-support libcurl4-openssl-dev libssl-dev libxml2-dev && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y r-base r-base-dev && \
    ln -fs /usr/share/zoneinfo/Europe/Madrid /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    locale-gen es_ES.UTF-8 && \
    wget --quiet https://download2.rstudio.org/rstudio-server-1.1.456-amd64.deb && \
    dpkg -i rstudio-server-1.1.456-amd64.deb && \
    rm rstudio-server-1.1.456-amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd rstudio && \
    echo "rstudio:rstudio" | chpasswd && \
    mkdir -p /home/rstudio/.rstudio/monitored/user-settings && \
    echo 'alwaysSaveHistory="0" \
          \nloadRData="0" \
          \nsaveAction="0"' \
          > /home/rstudio/.rstudio/monitored/user-settings/user-settings && \
    chown -R rstudio:rstudio /home/rstudio && \
    addgroup rstudio staff

RUN R -e "install.packages(\"tidyverse\")" && \
    rm -Rf /tmp/**/downloaded_packages

RUN R -e "install.packages(\"ggthemes\")" && \
    rm -Rf /tmp/**/downloaded_packages

RUN R -e "install.packages(\"wesanderson\")" && \
    rm -Rf /tmp/**/downloaded_packages

RUN R -e "install.packages(\"psych\")" && \
    rm -Rf /tmp/**/downloaded_packages

ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES.UTF-8
ENV LC_ALL es_ES.UTF-8

EXPOSE 8787

COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]