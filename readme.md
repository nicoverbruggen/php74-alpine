# docker-php74

## What is this?

This is a custom build based on PHP 7.4's docker image, with changes to make Laravel back-end testing easily possible.

## Where can I find it?

You can find the image on Docker Hub here: https://hub.docker.com/r/nicoverbruggen/php74.

## GitLab CI

For example, if you are running GitLab, you can use `.gitlab-ci` on your custom GitLab instance:

```
image: nicoverbruggen/php74:latest

cache:
  paths:
  - vendor/
  - node_modules/

tests:
  script:
  - curl -sS https://getcomposer.org/installer | php
  - php composer.phar install
  - yarn install
  - yarn run dev
  - vendor/bin/phpunit -v --configuration phpunit.ci.xml --coverage-text --colors=never
  after_script:
  - cat storage/logs/laravel.log 2>/dev/null
```

This will allow automatic tests of your application to occur.

A few notes:

- Front-end testing w/ Laravel Dusk is not supported in this version.
- This container ships with `npm` and `yarn`.

## How can I build this myself?

Use the Dockerfile, customize it as desired and build it!

Of course, you must replace `nicoverbruggen/php74` with something else if you want to publish your customized version yourself.

    docker build -t nicoverbruggen/php74 . && docker push nicoverbruggen/php74

If you want to tag the current version (let's say... `1.0`) based on the latest version you just pushed:

    docker image tag nicoverbruggen/php74:latest nicoverbruggen/php74:1.0
    docker push nicoverbruggen/php74:1.0

Anyone can run it afterwards:

    docker run nicoverbruggen/php74

You can also attach to the container w/ bash:

    docker run -i -t nicoverbruggen/php74 /bin/bash
