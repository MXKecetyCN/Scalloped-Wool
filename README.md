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
```
node基础镜像
noobx/jd:gitee
集成python与node镜像
noobx/jd:py
```