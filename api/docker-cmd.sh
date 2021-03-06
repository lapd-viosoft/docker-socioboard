#!/usr/bin/env sh

set -e

api_path=/opt/socioboard-api

folders='user publish feeds notification'
for folder in $folders; do
  absolute_path=${api_path}/${folder}
  cd ${absolute_path}
  nodemon app.js &
  log_files="${absolute_path}/public/logs/*.log ${log_files}"
done

tail -f ${log_files}
