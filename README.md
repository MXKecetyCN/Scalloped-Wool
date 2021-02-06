# jd-base1
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
