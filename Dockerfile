FROM	debian:buster
EXPOSE	80
EXPOSE	443
WORKDIR	/app
RUN apt-get update -yqq && apt-get install curl mutt msmtp bsd-mailx vim -y

ENV MAIL_ADRESS=<foo@gmail.com>
ENV MAIL_USER=<foo>
ENV MAIL_PASS=<password>

COPY	./ /app

CMD bash docker_utils/configure_mail.sh && bash
