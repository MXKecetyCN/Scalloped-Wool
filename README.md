# jd-base
如果您是第一次安装，请等待1-2分钟后执行：docker exec -it jd bash git_pull，如你是旁路由，请更换网络模式添加--network host \,食用方法.！↓：
 ```
 docker run -dit \
	-v $PWD/jd/config:/jd/config \
	-v $PWD/jd/log:/jd/log \
	-p 5678:5678 \
	-e ENABLE_HANGUP=true \
	-e ENABLE_WEB_PANEL=true \
	--name jd \
	--hostname jd \
	--restart always \
	noobx/jd:gitee
```
### 如需指定目录，请把$PWD更改为指定目录即可，不然则为当前目录！
执行上面命令之后建议执行'docker logs -f jd'查看安装进度，直到出现Welcome to Node.js v1x.x.0.代表成功！
#### 如需映射脚本出来直接在上面加一行!：
```
-v $PWD/jd/scripts:/jd/scripts \
```

node基础镜像
```
noobx/jd:gitee
```
集成python与node镜像
```
noobx/jd:py
```
shell一键安装docker与watchtower(by:老揭力)
```shell
wget -q https://raw.githubusercontent.com/dockere/jd-base/master/sample/jd-docker.sh -O jd-docker.sh && chmod +x jd-docker.sh && ./jd-docker.sh
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
6. Copy自定义脚本到容器目录
```shell
docker cp /宿主机上脚本存放路径/test.js jd:/jd/scripts
```
7. 查看创建日志
```shell
docker logs -f jd
```
8. 重置WEB面板密码
```shell
docker exec -it jd bash jd resetpwd
```
9. 查看挂机脚本日志
```shell
docker exec -it jd pm2 monit`或`docker exec -it jd pm2 logs
```
10. 重启容器
```
docker restart jd
```
11. 如何自动更新容器！
```
docker run -d \
    --name watchtower \
    --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower \
    --cleanup
```
