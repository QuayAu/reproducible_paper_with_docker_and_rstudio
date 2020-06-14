FROM rocker/rstudio
COPY . /home/rstudio
WORKDIR /home/rstudio
RUN chown -R rstudio /home/rstudio #write access for user "rstudio"

RUN apt-get update  && apt-get install -y \
  libpq-dev \
  build-essential \
  libcurl4-gnutls-dev \ 
  libxml2-dev \
  libssl-dev \
  libz-dev

RUN R -e "install.packages('devtools', dependencies = TRUE, repos = 'http://cran.rstudio.com/')" 
RUN R -e "install.packages('dplyr', dependencies = TRUE, repos = 'http://cran.rstudio.com/')" 
RUN R -e "install.packages('ggplot2', dependencies = TRUE, repos = 'http://cran.rstudio.com/')" 
