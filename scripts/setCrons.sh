. $WD/lib/newCron.sh
# 此文件已经暂停追踪修改，后续修改不会上传到github
# 解除：git update-index no-assume-blablabla
newCron "* */72 * * * $WD/scripts/cleanlog.sh"
# newCron "30 14 * * * /root/tg/bin/telegram-cli -W -e 'msg Pikachu_|_xsDoge /checkin'"