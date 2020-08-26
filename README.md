cf-inventory
============

Ever wondered what was running on a Cloud Foundry instance you own
and operate?  Wonder no more!

I wrote this small script for some client work, as I kept finding
our teams running into the same information gathering problems
over and over again.  Then I dockerized it because some people
have a hard time with Perl.

[See it on Docker Hub!][1]


Running it on Docker
--------------------

Running it is fairly straightforward.  First, point to your Cloud
Foundry, and authenticate via the `cf` CLI:

    export CF_API_ENDPOINT=https://api.system.foo.example.com
    cf api $CF_API_ENDPOINT
    cf login

Then, run the Docker container:

    docker run -it --rm -e CF_API_ENDPOINT \
      -e CF_OAUTH_TOKEN="$(cf oauth-token)" \
      -v $PWD:/data \
      filefrog/cf-inventory

This will create a file in the current working directory (outside
the container) named `inventory.yml`; which should have all of the
information you want or need!


Building (and Publishing) to Docker Hub
---------------------------------------

The Makefile handles building pushing.  For jhunt's:

    make push

Is all that's needed for release.  If you want to build it
locally, you can instead use:

    make build

If you want to tag it to your own Dockerhub username:

    IMAGE=you-at-dockerhub/cf-inventory make build push

By default, the image is tagged `latest`.  You can supply your own
tag via the `TAG` environment variable:

   IMAGE=... TAG=$(date +%Y%m%d%H%M%S) make build push

Happy Hacking!


[1]: https://hub.docker.com/r/filefrog/cf-inventory
