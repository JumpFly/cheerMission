photoPath="$(pwd)/cheerPhoto.jpg"
cheerBashPath="$(pwd)/cheer.sh"
listPath="$(pwd)/com.cheer.plist"

echo "输入数字(1:启动鼓励任务 2:终止鼓励任务):"
a=1
b=2
read num
if [[ $num -eq $a ]]
then
 launchctl unload -w ~/Library/LaunchAgents/com.cheer.plist
 cp ${photoPath} /tmp/cheerPhoto.jpg
 cp ${cheerBashPath} /tmp/cheer.sh
 chmod a+x /tmp/cheer.sh
 cp ${listPath} ~/Library/LaunchAgents/com.cheer.plist
 launchctl load -w ~/Library/LaunchAgents/com.cheer.plist
 echo "启动鼓励任务"
elif [[ $num -eq $b ]]
then
 launchctl unload -w ~/Library/LaunchAgents/com.cheer.plist
 echo "终止鼓励任务"
else
 echo "命令错误"
fi
