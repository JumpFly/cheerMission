# cheerMission

### 概要
 采用定时任务执行脚本完成弹窗 <br>
 只需要简单的shell命令来完成交互 <br>
 (当然也可以自定义执行脚本来完成其他事情) <br>
***

### 提示
```
可以将项目中的"cheerPhoto.jpg" 替换成自己想要的图片
（只需文件名保持一致即可。） 
不过由于脚本中写死了对应文件名为“cheerPhoto.jpg”故而暂不支持快捷替换 
有需要的同学可以自行修改 "cheer.sh" 、"cheerConf.sh" 脚本中的图片文件名，
下次更新时会完善该功能
```

***

### Mac版
#### macOs的plist任务 
#### 简易学习教程[：给Mac添加定时任务](https://www.jianshu.com/p/4bb74330c97d)

```
终端执行 bash cheerConf.sh 
按照提示进行启动/终止/设置间隔时长等操作
```

***

### Ubuntu版
### linux的crontab任务
```
终端执行 bash cheerConf.sh 
按照提示进行启动/终止/设置间隔时长等操作
```
```
注意：借助了linux的eog来打开图片，但可能会遇到“cannot open display”问题。
主要是因为使用定时任务执行脚本，而当前用户不允许其他用户进行图形化调用展示。
故而脚本中添加了执行 export DISPLAY=:0.0  
```
[借助这份资料解答](https://unix.stackexchange.com/questions/4249/anacron-job-complains-gtk-warning-cannot-open-display)


```
例行性工作排程 crontab   （周期性定时任务）
①用户执行crontab -e 编辑加入的任务 会保存到 /var/spool/cron/crontabs/username 文件中
②系统相关的任务 保存在/etc/crontab 文件中

crontab [-u username] [-l|-e|-r]
选项与参数:
-u :只有 root 才能进行这个任务,亦即帮其他使用者建立/移除 crontab 工作排程;
-e :编辑 crontab 的工作内容
-l :查阅 crontab 的工作内容
-r :移除所有的 crontab 的工作内容,若仅要移除一项,请用 -e 去编辑

crontab -e 
进入任务编辑，每行一个任务（六个字段）
字段含义: （0和7都代表星期天）
代表意义 	分钟 	小时 	日期 	月份 	周 	指令
数字范围 	0-59 	0-23 	1-31 	1-12 	0-7 	指令

*(星号)  代表任何时刻都接受的意思!
,(逗号)  0 3,6 * * * command    代表 3 与 6 都适用! （3:00和6:00）
-(减号)  20 8-12 * * * command 代表8点到12点之间的每小时的20 分
/n(斜线) */5 * * * * command 『每隔 n 单位间隔』 每5分钟进行一次

anacron 是一个每小时被crond执行一次的程序。
（被放置于/etc/cron.hourly）
[root@study ~]# anacron [-sfn] [job]..
[root@study ~]# anacron -u [job]..
选项与参数:
-s :开始一连续的执行各项工作 (job),会依据时间记录文件的数据判断是否进行;
-f :强制进行,而不去判断时间记录文件的时间戳;
-n :立刻进行未进行的任务,而不延迟 (delay) 等待时间;
-u :仅更新时间记录文件的时间戳,不进行任何工作。
job :由 /etc/anacrontab 定义的各项工作名称。

任务记录于 /etc/anacrontab 
天数 	延迟时间(分钟)	工作名称定义 	指令

------------------
crond 与anacron 的关系:
1. crond 会主动去读取 /etc/crontab, /var/spool/cron/*, /etc/cron.d/* 等配置文件,并依据『分、时、日、月、周』的时间设定去各项工作排程;
2. 根据 /etc/cron.d/0hourly 的设定,主动去 /etc/cron.hourly/ 目录下,执行所有在该目录下的执行文件;
3. 因为 /etc/cron.hourly/0anacron 这个脚本文件的缘故,主动的每小时执行 anacron ,并呼叫 /etc/anacrontab的配置文件;
4. 根据 /etc/anacrontab 的设定,依据每天、每周、每月去分析 /etc/cron.daily/, /etc/cron.weekly/, /etc/cron.monthly/内的执行文件,以进行固定周期需要执行的指令。
即使关机一段时间，当重新开机后，anacron会分析上次执行的任务时间来判断是否已超时周期，并开始执行。
```

***
### Windows版
#### dos命令+schtasks任务
#### [schtasks无法运行的情况](https://social.technet.microsoft.com/Forums/en-US/3b6ec501-9fd4-4176-9e90-212d01e9d2de/schtasks-task-status-quotcould-not-startquot-result-2147024894?forum=w7itprogeneral)

```
右键以管理员身份运行cheerConf.bat
(因为涉及到copy图片到C:\  需要管理员权限)
按照提示进行启动/终止/设置间隔时长等操作
(ps:dos写脚本略感痛苦啊....>_< !! 看完cheerConf.bat里面脚本命令的同学请不要扔我砖头)
```

***
