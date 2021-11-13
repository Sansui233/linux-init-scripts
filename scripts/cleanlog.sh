# This file should be set in crontable
cd /var/log
rm *.gz
rm nginx/*.gz
rm netdata/*.gz

# Example: deal with nohup.out log
dir=/usr/local/etc/trojan/
split -b 1024k ${dir}/nohup.out -d -a 3 -additional-suffix=.log
file=$(ls ${dir}/*.log | sort | tail -n1)
cat ${dir}/$file >| nohup.out
rm ${dir}/*.log