FROM josephkumarmichael/centos-serverspec-windows:latest
RUN mkdir /serverspec
COPY . /serverspec
WORKDIR /serverspec
