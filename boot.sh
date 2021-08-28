#!/bin/sh

#for entry in "."/*
#do
#  echo "$entry"
#done

echo "Script executed from: ${PWD}"
#
#BASEDIR=$(dirname $0)
#echo "Script location: ${BASEDIR}"
#apt-get update && \
#      apt-get -y install sudo
#sudo chmod 777 data.sqlite
#ls -l . | grep data.sqlite
#ls -l app
source venv/bin/activate

while true; do
    flask deploy
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo Deploy command failed, retrying in 5 secs...
    sleep 5
done

exec gunicorn -w 1 -b :5000 yowla:app
#exec gunicorn -b :5000 --access-logfile - --error-logfile - yowla:app --timeout 120
#exec gunicorn --workers 3 --bind unix:myproject.sock -m 000 --access-logfile - --error-logfile - yowla:app --timeout 120 >> /var/log/yowla.sys.log 2>&1

echo "EXECUTED GUNICORN!!"