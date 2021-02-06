# jd-base
docker run -dit \
	-v /你想存放的路径/jd/config:/jd/config `# 配置保存目录，冒号左边请修改为你想存放的路径` \
	-v /你想存放的路径/jd/log:/jd/log `# 日志保存目录，冒号左边请修改为你想存放的路径` \
	-p 5678:5678 \
	-e ENABLE_WEB_PANEL=ture \
	-e ENABLE_HANGUP=ture \
	--name jd \
	--hostname jd \
	--restart always \
	noobx/jd:gitee