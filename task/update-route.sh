#!/bin/bash

set -xe

pwd
env

cf api https://api.sys.kanpcf.com --skip-ssl-validation
cf login -u kan -p password -o biz_div1 -s dev
#cf api https://api.run.pivotal.io --skip-ssl-validation
#cf login -u knakamura@pivotal.io -p passw0rd -o APJ -s Development

cf apps |  grep -i go-web-kan

cf routes | grep -i go-web-kan

cf map-route go-web-kan-new cfapps.kanpcf.com --hostname go-web-kan

cf routes | grep -i go-web-kan

cf unmap-route go-web-kan cfapps.kanpcf.com --hostname go-web-kan

cf unmap-route go-web-kan-new cfapps.kanpcf.com --hostname go-web-kan-new

cf delete go-web-kan -f

cf rename go-web-kan-new go-web-kan
