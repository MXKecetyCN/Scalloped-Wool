# jd-base
重新构建了下镜像，减少镜像体积；原先是先pull LXK大佬库，目前是启动容器后再pull，如重新安装请等待1-2分钟后执行：docker exec -it jd bash git_pull
 ```
 docker run -dit \
	-v /root/jd/config:/jd/config \
	-v /root/jd/log:/jd/log \
	-p 5678:5678 \
	-e ENABLE_HANGUP=true \
	-e ENABLE_WEB_PANEL=true \
	--name jd \
	--hostname jd \
	--restart always \
	noobx/jd:gitee
```
node基础镜像
```
noobx/jd:gitee
```
集成python与node镜像
```
noobx/jd:py
```
# 你要知道的命令↓
1. 手动 git pull 更新脚本
    ```shell
    docker exec -it jd bash git_pull
    ```
2. 手动删除指定时间以前的旧日志
    ```shell
    docker exec -it jd bash rm_log
    ```
3. 手动导出所有互助码
    ```shell
    docker exec -it jd bash export_sharecodes
    ```
4. 手动启动挂机程序（**容器会在启动时立即启动挂机程序，所以你想重启挂机程序，你也可以重启容器，而不采用下面的方法。**）
    ```shell
    docker exec -it jd bash jd hangup
    ```
5. 手动执行薅羊毛脚本，用法如下(其中`-it`后面的`jd`为容器名，`bash`后面的`jd`为命令名，`xxx`为lxk0301大佬的脚本名称)，不支持直接以`node xxx.js`命令运行：

    ```
    docker exec -it jd bash jd xxx      # 如果设置了随机延迟并且当时时间不在0-2、30-31、59分内，将随机延迟一定秒数
    docker exec -it jd bash jd xxx now  # 无论是否设置了随机延迟，均立即运行
	```