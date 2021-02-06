#!/usr/bin/env bash
#添加hosts;如无法正常下载Github Raw文件，请注释掉
Host_IP=('151.101.88.133' '151.101.228.133')
Host_Name=('raw.githubusercontent.com' 'raw.githubusercontent.com')
for (( i=0; i<=${#Host_IP[@]}; i++ )) do
echo "${Host_IP[$i]} ${Host_Name[$i]}" >> /etc/hosts
done

my_scripts_list1="jd_lotteryMachine.js"  # 你想下载的js文件清单
scripts_base_url1=https://raw.githubusercontent.com/yangtingxiao/QuantumultX/master/scripts/jd/   # raw文件的基础网址

cd $ScriptsDir   # 在 git_pull.sh 中已经定义 ScriptsDir 此变量，diy.sh 由 git_pull.sh 调用，因此可以直接使用此变量
for js in $my_scripts_list1
do
  # 下载my_scripts_list中的每个js文件，重命名增加前缀"yangtingxiao"，增加后缀".new"
  echo -e "更新 $js ...\n"
  wget -q --no-check-certificate $scripts_base_url1$js -O yangtingxiao_$js.new

  # 如果上一步下载没问题，才去掉后缀".new"，如果上一步下载有问题，就保留之前正常下载的版本
  if [ $? -eq 0 ]; then
    mv -f yangtingxiao_$js.new yangtingxiao_$js
    echo -e "更新 $js 完成...\n"
  else
    [ -f yangtingxiao_$js.new ] && rm -f yangtingxiao_$js.new
    echo -e "更新 $js 失败，使用上一次正常的版本...\n"
  fi
done
