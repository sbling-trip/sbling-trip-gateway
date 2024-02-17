FROM nginx

RUN apt-get update \
  && apt-get install -y -qq sudo \
  && apt-get install -y -qq vim

RUN adduser -u 10000 sbling
RUN usermod -aG sudo sbling
RUN chsh -s /bin/bash sbling
RUN usermod --password root root
RUN echo 'sbling:sbling' | chpasswd
RUN echo 'root:root' | chpasswd
RUN echo 'sbling ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers


COPY sbling-trip.nginx.conf /etc/nginx/nginx.conf


EXPOSE 8080
USER sbling
WORKDIR /home/sbling

CMD nginx
