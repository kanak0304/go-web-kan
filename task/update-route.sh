#!/bin/bash

set -xe

pwd
env

cf api https://api.run.pivotal.io --skip-ssl-validation

cf login -u knakamura@pivotal.io -p passw0rd -o APJ -s Development

cf apps |  grep -i go-web-kan

cf routes | grep -i go-web-kan

cf map-route go-web-kan-new cfapps.io --hostname go-web-kan

cf routes | grep -i go-web-kan

cf unmap-route go-web-kan cfapps.io --hostname go-web-kan

cf unmap-route go-web-kan-new cfapps.io --hostname go-web-kan-new
