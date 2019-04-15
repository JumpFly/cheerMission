a=1
b=2
c=3
photoName="cheerPhoto.jpg"
photoPath="$(pwd)/${photoName}"
newPhotoPath="/tmp/${photoName}"
tempMissionBackUpPath="/tmp/tempCronMission.txt"
cheerShName="cheer.sh"
cheerShPath="/tmp/${cheerShName}"
cheerShNote="export DISPLAY=:0.0 
eog ${newPhotoPath}"
cronTime="0 */1 * * *"
 logFilePath="/tmp/mylog.log"

funWithInit(){
echo "`crontab -l`" > ${tempMissionBackUpPath}
cp ${photoPath} ${newPhotoPath}
echo "${cronTime} bash ${cheerShPath} >>${logFilePath} 2>&1" >> ${tempMissionBackUpPath}
crontab ${tempMissionBackUpPath}
}

funWithEnd(){
echo "`crontab -l`" > ${tempMissionBackUpPath}
$(sed -i "/${cheerShName}/d" ${tempMissionBackUpPath})
crontab ${tempMissionBackUpPath}
}


echo "输入数字(1:启动鼓励任务 2:终止鼓励任务 3:设置任务间隔(cron表达式)):"
read num
if [[ $num -eq $a ]]
then
 funWithEnd
 funWithInit
 echo "" >${logFilePath}
 echo "启动鼓励任务"
elif [[ $num -eq $b ]]
then
 funWithEnd
 echo "终止鼓励任务"
elif [[ $num -eq $c ]]
then
 echo "请设置cron表达式(分 时 日 月 周)："
 read cronTime
 funWithEnd
 funWithInit
 echo "设置完毕，输入crontab -l 查看已有任务"
else
 echo "命令错误"
fi
