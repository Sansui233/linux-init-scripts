# Add an item to CronTable
newCron(){
    crontab -l >| new_cron
    echo "$1" >> new_cron
    sort -u new_cron > new_cron2 # deduplicate
    crontab new_cron2 # set crontab
    
    rm new_cron2
    rm new_cron
}