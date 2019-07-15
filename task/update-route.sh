#!/bin/bash

set -xe

pwd
env

cf api https://api.sys.pas-g.kanlab.jp  --skip-ssl-validation
cf login -u user_a -p password -o demo -s dev01

cf apps |  grep -i go-web-kan

cf routes | grep -i go-web-kan

cf map-route go-web-kan-new apps.pas-g.kanlab.jp --hostname go-web-kan

cf routes | grep -i go-web-kan

cf unmap-route go-web-kan apps.pas-g.kanlab.jp --hostname go-web-kan

cf unmap-route go-web-kan-new apps.pas-g.kanlab.jp --hostname go-web-kan-new

cf delete go-web-kan -f

cf rename go-web-kan-new go-web-kan
