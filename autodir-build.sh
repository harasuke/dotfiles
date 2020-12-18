#!/bin/bash

projectName=$1;
projectType=$2; #telegraf, html, nodejs, python, C, etc..

#Currently supported types:
# - Telegram Bot using Telegraf API
case $projectType in
	telegraf)
    echo ☐ Creating folder structure...
    mkdir $projectName $projectName/assets $projectName/classes $projectName/database > /dev/null
    cd $projectName > /dev/null
    echo -e "\xE2\x9C\x94 - Done!"  

    echo ☐ Initializing npm modules
    npm init --yes > /dev/null
    npm install --save telegraf 
    echo -e "\xE2\x9C\x94 - Done!"  

    echo ☐ Initializing files 
    touch index.js > /dev/null
    FILE="./index.js"
    /bin/cat <<EOM >$FILE
const Telegraf = require('telegraf')
const bot = new Telegraf(process.env.BOT_TOKEN)
bot.start((ctx) => ctx.reply('Hello'))
bot.launch()
EOM
    echo -e "\xE2\x9C\x94 - Done!"  
    ;; 
esac
