
# 42_correction_stalk
Bash scripts that sends you a mail when a 42 student has closed his team for a given project.

I configured [msmtp](https://doc.ubuntu-fr.org/msmtp) for gmail but you can change it to whatever you want. 

You'll have to allow "Less secure applications" on your gmail account.

## Usage:

    ./check.sh <login> <project> <mail list file> 

add_cron.sh allow you to add a cron job to check every minute.

    ./add_cron.sh <login> <project> <mail list file>

Yes, i could "probably" dockerize this, and i did

## Build:

    docker build . -t stalk_bot

## Run:

     docker run -e MAIL_USER=<foo> -e MAIL_ADDRESS=<foo>@gmail.com -e MAIL_PASS=<password> -it stalk_bot

