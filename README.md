# jd-base
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
重新构建了下镜像，减少镜像体积；原先是先pull LXK大佬库，目前是启动容器后再pull，如重新安装后请等待1-2分钟