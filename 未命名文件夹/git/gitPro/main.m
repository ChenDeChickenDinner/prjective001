
git init

git status

git add /git add .   .gitignore

git commit


git clone

git remote
git remote -v

git fetch 更新远程库信息
git pull (fetch + merge) 更新到本地


git push
git push origin


git tag
git tag -r

git tag xx
git push origin xx


本地项目()与远程空白项目关联
1.未关联远程
2.本地git 可能是有 可能是无
#git初始化
git init
#设置remote地址
git remote add 地址
#将全部文件加入git版本管理 .的意思是将当前文件夹下的全部文件放到版本管理中
git add .
#提交文件 使用-m 编写注释
git commit -m "注释"
#推送到远程分支
git push


本地项目()与远程有文件的项目关联
#git初始化
git init
#设置remote地址
git remote add  origin 地址
#获取远程仓库master分支上的内容
git pull origin master
#将当前分支设置为远程仓库的master分支
git branch --set-upstream-to=origin/master master
#将全部文件加入git版本管理 .的意思是将当前文件夹下的全部文件放到版本管理中
git add .
#提交文件 使用-m 编写注释
git commit -m "注释"
#推送到远程分支
git push

