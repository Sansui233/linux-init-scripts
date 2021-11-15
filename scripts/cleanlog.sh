# This file should be set in crontable
cd /var/log
rm *.gz
rm nginx/*.gz
rm netdata/*.gz

cleanNohup(){
    dir="$1"
    split -b 1024k ${dir}/nohup.out -d -a 3 --additional-suffix=".log"
    file=$(ls ${dir}/*.log | sort | tail -n1)
    cat $file >| nohup.out
    rm ${dir}/*.log
}

# Example: deal with nohup.out log
cleanNohup /usr/local/etc/trojan
