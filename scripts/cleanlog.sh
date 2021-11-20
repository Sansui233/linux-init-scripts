# This file should be set in crontable
rm /var/log/*.gz
rm /var/log/nginx/*.gz

cleanNohup(){
    dir="$1"
    split -b 1024k ${dir}/nohup.out -d -a 3 --additional-suffix=".log"
    file=$(ls ${dir}/*.log | sort | tail -n1)
    cat $file >| nohup.out
    rm ${dir}/*.log
}

# Example: deal with nohup.out log
cleanNohup /usr/local/etc/trojan
