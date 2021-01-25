FROM r-base:3.5.2
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev
COPY / /
RUN R -e "install.packages('plumber')"
EXPOSE 8000
ENTRYPOINT ["Rscript", "serve.R"]
