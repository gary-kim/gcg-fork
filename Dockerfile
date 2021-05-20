FROM ruby:2-alpine

LABEL maintainer="Gary Kim <gary@garykim.dev>"
RUN apk add --no-cache git && apk add --no-cache --virtual .gem-installdeps build-base=0.5-r2

RUN mkdir -p /app
COPY . /app
RUN gem install /app/*.gem && rm -rf /app

ENV SRC_PATH /usr/local/src/your-app
RUN mkdir -p $SRC_PATH

VOLUME [ "$SRC_PATH" ]
WORKDIR $SRC_PATH

CMD ["--help"]
ENTRYPOINT ["github_changelog_generator"]
