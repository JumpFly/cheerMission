a=1
b=2
c=3
duration=10
photoPath="$(pwd)/cheerPhoto.jpg"
cheerBashPath="$(pwd)/cheer.sh"
listPath="$(pwd)/com.cheer.plist"
plistPart1='<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Disabled</key>
    <false/>
    <key>Label</key>
    <string>com.czw.cheer</string>
    <key>RunAtLoad</key>
    <true/>
    <key>ProgramArguments</key>
    <array>
      <string>/tmp/cheer.sh</string>
    </array>

    <key>StartInterval</key>
    <integer>'

plistPart2='</integer>
    
    <key>StandardOutPath</key>
    <string>/tmp/stdout.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/stderr.log</string>
</dict>
</plist>'


echo "输入数字(1:启动鼓励任务 2:终止鼓励任务 3:设置任务间隔时长(秒)):"
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
elif [[ $num -eq $c ]]
then
 echo "请输出间隔时长(秒)："
 read duration
 echo "${plistPart1}${duration}${plistPart2}" >"${listPath}"
 echo "请重启任务。"
else
 echo "命令错误"
fi
