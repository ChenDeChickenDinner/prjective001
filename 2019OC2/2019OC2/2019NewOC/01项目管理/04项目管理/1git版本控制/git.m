//
//  git.m
//  XcodeStudy
//
//  Created by xs on 2017/11/20.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "git.h"

@implementation git

@end
/**
发展史：

仓库 + 资源文件：

 仓库:只能记录被追踪文件的 变化状态，保存每次提交的快照
 资源文件：本身只受人为的修改，仓库不能操作文件本身，只能利用仓库 切换到各种状态下的文件

本地版本控制系统（需要对文件的修改 保存 做监控）

集中化的版本控制系统(让在不同系统上的开发者协同工作，服务端发生故障则无法恢复)--svn

分布式版本控制系统(多处镜像，每一次的克隆操作，实际上都是一次对代码仓库的完整备份) ---git



硬盘/usr/bin/git
 git                snmpdf
 git-cvsserver            snmpget
 git-receive-pack        snmpgetnext
 git-shell            snmpinform
 git-upload-archive        snmpnetstat
 git-upload-pack            snmpset


git的三层次配置：当前工程、当前用户全局（global）、系统全局（system）

 (A:) system： 配置对所有的用户的所有工程都起作用，
 位置：硬盘/usr/bin/git/etc/gitconfig

  (B:) global： 配置对当前用户所有的工程起作用，用户级配置文
文件位置位置：用户/gitconfig
文件内容：
 [user]
     name = chenxiaowei
     email = 2332204966@qq.com
 [core]
     excludesfile = /Users/xs/.gitignore_global
 [difftool "sourcetree"]
     cmd = opendiff \"$LOCAL\" \"$REMOTE\"
     path =
 [mergetool "sourcetree"]
     cmd = /Applications/SourceTree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
     trustExitCode = true
 [filter "media"]
     required = true
     clean = git media clean %f
     smudge = git media smudge %f
 [filter "hawser"]
     clean = git hawser clean %f
     smudge = git hawser smudge %f
     required = true

 (C:) 当前工程： 粒度针对当前操作的工程,仓库级配置文
文件位置：当前仓库目录/git/config
文件内容：
 [core]
     repositoryformatversion = 0
     filemode = true
     bare = false
     logallrefupdates = true
     ignorecase = true
     precomposeunicode = true
     [remote "origin"]
     url = git@10.0.30.24:HuabaoZhitou_ios/HBStockWarning.git
     fetch = +refs/heads/*:refs/remotes/origin/*
 [branch "developer上证云条件单"]
     remote = origin
     merge = refs/heads/developer上证云条件单
     [branch "master"]
     remote = origin
     merge = refs/heads/master


概念，操作
 0:每一项的配置名称又叫做“section”，“section”下面的每一行对应着一个key和一个value
 1:在读取配置时候，每个级别重写前一个级别的值，配置文件的权重是仓库>全局>系统，Git会使用这一系列的配置文件来存储你定义的偏好，


 git config（git 配置）
 usage: git config [<options>]

 Config file location
 --global              use global config file
 --system              use system config file
 --local               use repository config file
 -f, --file <file>     use given config file
 --blob <blob-id>      read config from given blob object

 Action
 --get                 get value: name [value-regex]（获取一个配置项）
 --get-all             get all values: key [value-regex]（获取所以的配置项）
 --get-regexp          get values for regexp: name-regex [value-regex]
 --get-urlmatch        get value specific for the URL: section[.var] URL
 --replace-all         replace all matching variables: name value [value_regex]
 --add                 add a new variable: name value（增加一个配置项）
 --unset               remove a variable: name [value-regex]（删除一个配置）
 --unset-all           remove all matches: name [value-regex]（删除全部配置）
 --rename-section      rename section: old-name new-name （重命名某组）
 --remove-section      remove a section: name （删除某组）
 -l, --list            list all (查看配置文件)
 -e, --edit            open an editor （编辑配置文件）
 --get-color           find the color configured: slot [default]（设置颜色）
 --get-colorbool       find the color setting: slot [stdout-is-tty]

 Type
 --bool                value is "true" or "false"
 --int                 value is decimal number
 --bool-or-int         value is --bool or --int
 --path                value is a path (file or directory name)

 Other
 -z, --null            terminate values with NUL byte
 --name-only           show variable names only
 --includes            respect include directives on lookup
 --show-origin         show origin of config (file, standard input, blob, command line)

用git config命令来列出可以在该处找到的所有的设置
 命令参数 –list, 简写 -l  ; 格式：git config [–local|–global|–system] -l
 查看仓库级的config，即.git/.config，命令：git config –local -l
 查看全局级的config，即C:\Users\zuoyu.ht\.gitconfig，命令：git config –global -l
 查看系统级的config，即D:\Program Files\Git\etc\gitconfig，命令：git config –system -l
 查看当前生效的配置，命令：git config -l，这个时候会显示最终三个配置文件计算后的配置信息


使用git config命令编辑配置文件
 命令参数 –edit, 简写 -e  ; 格式：git config [–local|–global|–system] -e
 查看仓库级的config，即.git/.config，命令：git config –local -e，与–list参数不同的是，git config -e默认是编辑仓库级的配置文件。
 查看全局级的config，即C:\Users\zuoyu.ht\.gitconfig，命令：git config –global -e
 查看系统级的config，即D:\Program Files\Git\etc\gitconfig，命令：git config –system -e
 执行这个命令的时候，git会用配置文件中设定的编辑器打开配置文件

使用git config命令编辑一个配置项
 git config --global user.name "wirelessqa"
 git config --global user.email wirelessqa.me@gmail.com

 使用git config命令增加一个配置项
 参数  –add ; 格式: git config [–local|–global|–system] –add section.key value(默认是添加在local配置中)
注意add后面的section,key,value一项都不能少，否则添加失败。比如我们执行：git config –add cat.name tom


  使用git confi命令删除一个配置项
 命令参数 –unset  ; 格式：git config [–local|–global|–system] –unset section.key

配置你的编缉器
你的标识已经设置，你可以配置你的缺省文本编辑器，Git在需要你输入一些消息时会使用该文本编辑器。
 缺省情况下，Git使用你的系统的缺省编辑器，这通常可能是vi 或者 vim。如果你想使用一个不同的文本编辑器，例如Emacs，你可以做如下操作
 git config --global core.editor emacs

配置你的比较工具
 另外一个你可能需要配置的有用的选项是缺省的比较工具它用来解决合并时的冲突。例如，你想使用vimdiff
 git config --global merge.tool vimdiff


Git 别名
Git 并不会在你输入部分命令时自动推断出你想要的命令。 如果不想每次都输入完整的 Git 命令，可以通过 git config 文件来轻松地为每一个命令设置一个别名


获取 Git 仓库
第一种是在现有项目或目录下导入所有文件到 Git 中(在现有目录中初始化仓库，git init)
1:该命令将创建一个名为 .git 的子目录，目录含有你初始化的 Git 仓库中所有的必须文件，这些文件是 Git 仓库的骨干。
2：在这个时候我们仅是做了一个初始化的操作，你的项目里的文件还没有被跟踪
3：如果你是在一个已经存在文件的文件夹（而不是空文件夹）中初始化 Git 仓库来进行版本控制的话，你应该开始跟踪这些文件并提交。 你可通过 git add 命令来实现对指定文件的跟踪
4:然后执行 git commit 提交
5：此时 .git 的子目录 中的文件 才有记录信息 ，当前被跟踪的文件的信息、


第二种是从一个服务器克隆一个现有的 Git 仓库（）
1：如果你想获得一份已经存在了的 Git 仓库的拷贝，要用到 git clone 命令，
 Git 克隆的是该 Git 仓库服务器上的几乎所有数据，而不是仅仅复制完成你的工作所需要文件。
 当你执行 git clone 命令的时候，默认配置下远程 Git 仓库中的每一个文件的每一个版本都将被拉取下来。
 2:示例,git clone https://github.com/libgit2/libgit2

 3:拉取的前提是什么（首先是个什么，仓库？任意资源文件？权限处理？），支持哪些协议方式 https://..git://..等，
 4： 克隆后的状态，在当前目录下创建一个名为 “libgit2” 的目录，并在这个目录下初始化一个 .git 文件夹，
 从远程仓库拉取下所有数据放入 .git 文件夹，然后从中读取最新版本的文件的拷贝（最后：git管理文件 + 资源文件）


仓库目录下的每一个文件都不外乎这两种状态：
 A: 未跟踪文件:既不存在于上次快照的记录中，也没有放入暂存区
 B:已跟踪的文件:是指那些被纳入了版本控制的文件，在上一次快照中有它们的记录,状态可能处于
     a:未修改，/b: 已修改或/ c: 已放入暂存区

Untracked(未跟踪) -ungig(未修改)- Modified(已修改) - Staged(已暂存)

 Untracked:init的仓库中的文件默认都是未被跟踪的，clone下来的仓库中的所有文件都属于已跟踪文件，并处于未修改状态。



git status 查看当前仓库状态
 1:展示当前仓库所有分支，并*标明当前所在分支
 2:展示 未被 推送/拉取的 操作
 3：展示当前仓库文件状态
     0:若有未被跟踪的文件会被展示出来 Untracked files:
     1:没有任何修改，nothing to commit, working tree clean:
     2：列举已修改但未被暂存的文件 Changes not staged for commit:
     3：列举修改且被暂存的文件 Changes to be committed:
4：git status --short/git status -s(紧凑的格式输出)
新添加的未跟踪文件前面有 ?? 标记
新添加到暂存区中的文件前面有 A 标记
修改过的文件前面有 M 标记（）
 1:出现在靠左边的 M 表示该文件被修改了并放入了暂存区（左M）
 2:出现在右边的 M 表示该文件被修改了但是还没放入暂存区（右M）
 3:MM在工作区被修改并提交到暂存区后又在工作区中被修改了（MM）


 忽略文件
 1:无需纳入 Git 的管理，也不希望它们总出现在未跟踪文件列表
 2:我们可以创建一个名为 .gitignore 的文件，列出要忽略的文件模式


跟踪文件
 A:加入跟踪(git add)
 a:在仓库中出现的新文件，Git 不会自动将之纳入跟踪范围，需要手动添加跟踪，第一次加入跟踪后自动添加到缓存中等待提交 （属于Staged(已暂存)状态）
 b: git add 命令使用文件或目录的路径作为参数；如果参数是目录的路径，该命令将递归地跟踪该目录下的所有文件
 c:在Xcode中 新建的文件 会自动加入跟踪，处于暂存状态

 B:移除跟踪（git rm --cached ）
 1：把文件从 Git 仓库中删除（亦即从暂存区域移除），但仍然希望保留在当前工作目录中。 换句话说，你想让文件保留在磁盘，但是并不想让 Git 继续跟踪。

 C:移除文件（git rm）
 1:可以用 git rm 命令完成此项工作，并连带从工作目录中删除指定的文件，这样以后就不会出现在未跟踪文件清单中了
 2：如果移除修改过并且已经放到暂存区域的文件的话，则必须要用强制删除选项 -f，防止误删还没有添加到快照的数据，这样的数据不能被 Git 恢复


放弃修改（git checkout --文件名）
 1:前提此命令 只对被跟踪的文件有效，且会对文件的内容有影响
 2:作用范围，文件的编辑，手动删除，路径的移动 都算修改，都可以通过此命令撤销，但注意 一旦撤销则无法恢复


暂存修改（编辑，删除都算修改）

 A:暂存已修改文件（git add）
 a:在修改文件后，此时文件的状态为Changes not staged for commi，说明已跟踪文件的内容发生了变化，但还没有放到暂存区
 b:要暂存这次修改，需要运行 git add 命令,把已跟踪的文件放到暂存区（属于Staged(已暂存)状态）

 B:再次修改暂存的文件
 a:当 当前文件处于 被暂存状态 Changes to be committed 时候 再次修改文件（此时文件有二个状态：文件同时出现在暂存区和非暂存区）
 b:最后暂存这次修改，需要运行 git add 命令,把已跟踪的文件放到暂存区（属于Staged(已暂存)状态）

 C:git commit 时，Git 只会提交的是 你最后一次运行 git add 命令时的那个版本，未被提交到暂存区的文件，commit时候不会提交。

取消暂存（git reset HEAD 文件名）
 1:只是将文件从暂存区移出来，不会对文件的内容有影响


查看更变
 A:尚未暂存的文件更新了哪些部分 (git diff)
    1：此命令比较的是工作目录中当前文件和暂存区域快照之间的差异， 也就是修改之后还没有暂存起来的变化内容
    2：请注意，git diff 本身只显示 跟 上次 暂存的快照对比 得出 尚未暂存的改动，而不是自上次提交以来所做的所有改动。
      （SO，当修改后暂存了，但没提交，再次修改，此时 git diff 出来的是当前 与上一次暂存的做对比的）


 B:已经暂存的文件更新了哪些部分(git diff --cached/--staged )
 1:此命令比较的是暂存区域 与上一次 提交 之间的差异

 C:Git Diff 的插件版本
在本书中，我们使用 git diff 来分析文件差异。 但是，如果你喜欢通过图形化的方式或其它格式输出方式的话，
可以使用 git difftool 命令来用 Araxis ，emerge 或 vimdiff 等软件输出 diff 分析结果。
使用 git difftool --tool-help 命令来看你的系统支持哪些 Git Diff 插件




提交

 A:提交更新(git commit)
    1：只将暂存区的更新提交到仓库，形成版本快照，对于 被修改的（新增，编辑，删除）但未加入缓存的记录 不会提交到仓库
    2：注意，因为commit只提交缓存中的内容，当有改动（比如删除等严重操作时候未被加入暂存，则此操作在仓库层级是不生效的，此时 若此仓库只是本地仓库则会造成损失，若是远程仓库则可以避免失误）
    2：这种方式会启动文本编辑器以便输入本次提交的说明。 (默认会启用 shell 的环境变量 $EDITOR 所指定的软件，一般都是 vim 或 emacs)
    3:默认的提交消息包含最后一次运行 git status 的输出，放在注释行里，

 B:跳过使用暂存区域提交更新(git commit -a)
    1:Git 会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过 git add 步骤

 C:git commit --amend命令是修复最新提交的便捷方式。
     1:它允许你将缓存的修改和之前的提交合并到一起，而不是提交一个全新的快照。
     2:它还可以用来简单地编辑上一次提交的信息而不改变快照。


移动文件（git mv file_from file_to）
其实，运行 git mv 就相当于运行了下面三条命令：
mv README.md README
git rm README.md
git add README




查看提交历史(git log)
在提交了若干更新，又或者克隆了某个项目之后，你也许想回顾下提交历史。
会按提交时间列出所有的更新，最近的更新排在最上面。 正如你所看到的，这个命令会列出每个提交的 SHA-1 校验和、作者的名字和电子邮件地址、提交时间以及提交说明。


git log 有许多参数选项可以帮助你搜寻你所要找的提交， 接下来我们介绍些最常用的
-p:用来显示每次提交的内容差异
-2：来仅显示最近两次提交,限制输出长度
--stat：每次提交的简略的统计信息
--graph:个选项添加了一些ASCII字符串来形象地展示你的分支、合并历史,当 oneline 或 format 与另一个 log 选项 --graph 结合使用时尤其有用

 --pretty:个选项可以指定使用不同于默认格式的方式展示提交历史。 这个选项有一些内建的子选项供你使用
 1: git log --pretty=oneline/short/，full/fuller
 2: git log --pretty=format(常用的选项 列出了常用的格式占位符写法及其代表的意义。)
     %H:提交对象（commit）的完整哈希字串/  %h:提交对象的简短哈希字串
     %T:树对象（tree）的完整哈希字串/ %t:树对象的简短哈希字串
     %P:父对象（parent）的完整哈希字串/ %p:父对象的简短哈希字串
     %an:作者（author）的名字/ %ae:作者的电子邮件地址/%ad:作者修订日期（可以用 --date= 选项定制格式）/ %ar:作者修订日期，按多久以前的方式显示/
     %cn:提交者（committer）的名字/%ce:提交者的电子邮件地址/%cd:提交日期/%cr:提交日期，按多久以前的方式显示
     %s:提交说明








标签
Git 可以给历史中的某一个提交打上标签，以示重要。 比较有代表性的是人们会使用这个功能来标记发布结点（v1.0 等等）

创建标签
1:轻量标签（lightweight）:一个轻量标签很像一个不会改变的分支 - 它只是一个特定提交的引用,轻量标签本质上是将提交校验和存储到一个文件中 - 没有保存任何其他信息
2：附注标签（annotated）:附注标签是存储在 Git 数据库中的一个完整对象。 它们是可以被校验的；其中包含打标签者的名字、电子邮件地址、日期时间；还有一个标签信息；并且可以使用 GNU Privacy Guard （GPG）签名与验证
3:通常建议创建附注标签，这样你可以拥有以上所有信息；但是如果你只是想用一个临时的标签，或者因为某些原因不想要保存那些信息，轻量标签也是可用的。

4:创建附注标签 git tag -a v1.4 -m 'my version 1.4'(-a  标签名称，-m 备注信息)
5：创建轻量标签 git tag v1.4-lw （只需要提供标签名字）
6:后期打标签，你也可以对过去的提交打标签

列出标签（git tag）
1:这个命令以字母顺序列出标签；但是它们出现的顺序并不重要。
2：你也可以使用特定的模式查找标签。 例如，Git 自身的源代码仓库包含标签的数量超过 500 个。 如果只对 1.8.5 系列感兴趣，可以运行 git tag -l 'v1.8.5*'

查看标签信息(git show）
1：不会看到额外的标签信息。 命令只会显示出提交信息： git show v1.4-lw


共享标签（git push origin [tagname])
1:默认情况下，git push 命令并不会传送标签到远程仓库服务器上。 在创建完标签后你必须显式地推送标签到共享服务器上

检出标签
1: 在 Git 中你并不能真的检出一个标签，因为它们并不能像分支一样来回移动。 如果你想要工作目录与仓库中特定的标签版本完全一样，可以使用 git checkout -b [branchname] [tagname] 在特定的标签上创建一个新分支：






提交对象(commit)
 1:Git 保存的不是文件的变化或者差异，而是一系列不同时刻的文件快照。
 2:在进行提交操作时，Git 会保存一个提交对象（commit object），该提交对象会包含一个指向暂存内容快照的指针
 3:该提交对象还包含了作者的姓名和邮箱、提交时输入的信息以及指向它的父对象的指针.首次提交产生的提交对象没有父对象，普通提交操作产生的提交对象有一个父对象，而由多个分支合并产生的提交对象有多个父对象


提交对象产生过程
 暂存--每个文件产生一个blob 对象（保存着文件)
 1:暂存操作会为每一个文件计算(校验和)（使用我们在 起步 中提到的 SHA-1 哈希算法）
 2:然后会把当前版本的文件快照保存到 Git 仓库中（Git 使用 blob 对象来保存它们）
 3:最终将校验和加入到暂存区域等待提交

 提交
 1:Git 会先计算每一个子目录 的 (校验和)，然后在 Git 仓库中这些校验和保存为树对象----(由每一个子目录计算得出校验和，产生树对象)
 2:Git 便会创建一个提交对象，它除了包含上面提到的那些信息外，还包含指向这个树对象（项目根目录）的指针----（产生提交对象)
 3:首次提交对象及其树结构:commit(提交对象){tree(树对象) + blob(快照对象)}

 4:提交对象及其父对象:每次产生的提交对象会包含一个指向上次提交对象（父对象）的指针。（commit1<---commit2<---commit3<---commit4<---commit5）


分支(可变，指向 commit 类型对象，的指针)commitX
 A:本质是什么
 1：Git 的分支，其实本质上仅仅是---指向(提交对象)的（可变)指针,Git 的默认分支名字是 master。
 2：代表该分支的 可变指针，会随着每次的提交 指向 最新的提交对象。
 3:（commit1<---commit2<---commit3<---commit4<---commit5 = commitX）代表此分支的指针永远是 指向 分支上最新的那个提交对象吗

 B:创建一个新分支(git branch)
 1:它只是为你创建了一个可以移动的新的指针(a:仓库初始化 自动 创建一个名为master的分支/b:由一个提交对象创建一个指针)

 C:删除一个分支（git branch -d hotfix）

指向当前所在的分支(HEAD指针)
1：有一个名为 HEAD 的特殊指针，指向当前所在的本地分支，只能指向commitX

分支切换（git checkout）
 1:：要切换到一个已存在的分支，你需要使用 git checkout 命令,就是改变 HEAD指针 的指向




分支合并(git merge)
 1:想合并到哪个分支上，就先切换到目标分支--git checkout master
 2：git merge hotfix ,将需要合并的分支 合并到目标分支

a：合并的时候若 如果顺着一个分支走下去能够到达另一个分支，那么 Git 在合并两者的时候，只会简单的将指针向前推进（指针右移），因为这种情况下的合并操作没有需要解决的分歧——这就叫做 “快进（fast-forward）”。
b:二个分支中谁都找不谁，但有共同的祖先，三方合并,Git 将此次三方合并的结果做了一个新的快照并且自动创建一个新的提交指向它。 这个被称作一次合并提交，它的特别之处在于他有不止一个父提交。

解决冲突
 1:在合并时候当对同一个文件的同一个部分进行了不同的修改，Git 就没法干净的合并它们
 2:此时 Git 做了合并，但是没有自动地创建一个新的合并提交。 Git 会暂停下来，等待你去解决合并产生的冲突
 3:任何因包含合并冲突而有待解决的文件，都会以未合并状态标识出来
    1:处于冲突的文件 git 不会将它放入暂存区，此时的文件还是处于未合并（unmerged）状态
    2:会在有冲突的文件中加入标准的冲突解决标记（1:使用 ======= 分割二个分支 2：<<<<<<< HEAD:index.html  与 分隔符直接 是当前分支的状态/>>>>>>> iss53:index.html  与 分隔符直接 是 被合并分支的状态 ）
     <<<<<<< HEAD:index.html
     <div id="footer">contact : email.support@github.com</div>
     =======
     <div id="footer">
     please contact us at support@github.com
     </div>
     >>>>>>> iss53:index.html

 4:手动编辑修改文件
 5:在你解决了所有文件里的冲突之后，对每个文件使用 git add 命令来将其标记为冲突已解决。 一旦暂存这些原本有冲突的文件，Git 就会将它们标记为冲突已解决。
 6:退出合并工具之后，Git 会询问刚才的合并是否成功。 如果你回答是，Git 会暂存那些文件以表明冲突，最后再提交





查看远程仓库(git remote)
 0:远程仓库 跟 本地仓库 的关系：他们本质是一个仓库对象，跟踪的是同一个对象，只是各个仓库 保存的监控进度不同。
 1:如果想查看你已经配置的远程仓库服务器，可以运行 git remote 命令。 它会列出你指定的每一个远程服务器的简写
 2:你也可以指定选项 -v，会显示需要读写远程仓库使用的 Git 保存的简写与其对应的 URL。
 3:如果你的远程仓库不止一个，该命令会将它们全部列出。
 4:如果想要查看某一个远程仓库的更多信息，可以使用 git remote show [remote-name] 命令。 如果想以一个特定的缩写名运行这个命令，例如 origin
     A:它也同样地列出了哪些远程分支不在你的本地，
     B:哪些远程分支已经从服务器上移除了，
     C:还有当你执行 git pull 时哪些分支会自动合并。


添加远程仓库(git remote add <shortname> <url>)
 1:添加一个新的远程 Git 仓库，同时指定一个你可以轻松引用的简写
 2:添加远程仓库的条件
 3:可以为本地仓库添加多个远程仓库
 4:移除一个远程仓库 git remote rm



从远程仓库中抓取与拉取(git fetch [remote-name])
 1:这个命令会访问远程仓库，从中拉取所有你还没有的数据。 执行完成后，你将会拥有那个远程仓库中所有分支的引用，可以随时合并或查看。(拉取了什么)
 2:必须注意 git fetch 命令会将数据拉取到你的本地仓库 - 它并不会自动合并或修改你当前的工作。 当准备好时你必须手动将其合并入你的工作（拉起后放哪了）
 3:所有分支 都会拉取下拉吗 ，还是只拉取 不 存入暂存区


远程分支
 1:git fetch 时候，当抓取到新的远程跟踪分支时，本地不会自动生成一份可编辑的副本（拷贝），只有一个不可以修改的 分支 指针，指向远程的对应分支


检出,跟踪分支
1:当克隆一个仓库时，它通常会自动地创建一个跟踪 origin/master 的 master 分支
2:检出远程分支到本地，这会给你一个用于工作的本地分支，并且起点位于 当前远程分支(git checkout -b serverfix origin/serverfix)

推送分支
 1:推送本地分支到远程，本地的分支并不会自动与远程仓库同步 - 你必须显式地推送想要分享的分支(git push [remote-name] [branch-name])


删除远程分支(git push origin --delete serverfix)
1：基本上这个命令做的只是从服务器上移除这个指针。 Git 服务器通常会保留数据一段时间直到垃圾回收运行，所以如果不小心删除掉了，通常是很容易恢复的


从远程仓库拉取分支数据(git pull)
1:git pull 命令来自动的抓取然后合并远程分支到当前分支
2:本质 由于 git pull 的魔法经常令人困惑所以通常单独显式地使用 fetch 与 merge 命令会更好一些。

推送分支数据到远程仓库(git push [remote-name] [branch-name])
1:只有当你有所克隆服务器的写入权限，并且之前没有人推送过时，这条命令才能生效(先拉取，让本地分支与远程分支保持最新的同步状态)





 仓库的传输协议
 A:本地协议（Local protocol）
 1：此时的远程版本库就是硬盘内的另一个目录。 这常见于团队每一个成员都对一个共享的文件系统（例如一个挂载的 NFS）拥有访问权，或者比较少见的多人共用同一台电脑的情况
 2:利用共享文件系统，就可以从本地版本库克隆（clone）、推送（push）以及拉取（pull）


 Git 协议
 1:这是包含在 Git 里的一个特殊的守护进程；它监听在一个特定的端口（9418），类似于 SSH 服务，但是访问无需任何授权。 要让版本库支持 Git 协议，需要先创建一个 git-daemon-export-ok 文件 —— 它是 Git 协议守护进程为这个版本库提供服务的必要条件 —— 但是除此之外没有任何安全措施
 2:要么谁都可以克隆这个版本库，要么谁也不能。 这意味着，通常不能通过 Git 协议推送。 由于没有授权机制，一旦你开放推送操作，意味着网络上知道这个项目 URL 的人都可以向项目推送数据
 3:优点,目前，Git 协议是 Git 使用的网络传输协议里最快的
 4:缺点,Git 协议缺点是缺乏授权机制,搭建成本高

 SSH 协议
 1:设 Git 服务器时常用 SSH 协议作为传输协议。 因为大多数环境下已经支持通过 SSH 访问 —— 即时没有也比较很容易架设。 SSH 协议也是一个验证授权的网络协议；
 2:优势，SSH 架设相对简单， 其次，通过 SSH 访问是安全的 —— 所有传输数据都要经过授权和加密
 3：缺点,SSH 协议的缺点在于你不能通过他实现匿名访问。 即便只要读取数据，使用者也要有通过 SSH 访问你的主机的权限，这使得 SSH 协议不利于开源的项目


 B:HTTP/S 协议
 1:是运行在标准的 HTTP/S 端口上并且可以使用各种 HTTP 验证机制，这意味着使用起来会比 SSH 协议简单的多，比如可以使用 HTTP 协议的用户名／密码的基础授权，免去设置 SSH 公钥
 2:支持像 git:// 协议一样设置匿名服务;也可以像 SSH 协议一样提供传输时的授权和加密。 而且只用一个 URL 就可以都做到

 仓库操作--(验证层面)
 1:https 可以随意克隆github上的项目，而不管是谁的；在pull/push的时候是需要验证用户名和密码的
 2:ssh 克隆者必须是拥者或管理员，且需要先添加 SSH key ，否则无法克隆。在pull/push的时候不再是验证用户名和密码，而是通过验证ssh的方式来验证用户


仓库的公开、私有化-- 访问层面
 1:此仓库是放在哪里的，谁可以访问，三方的git托管服务一般是公开的 谁都可以访问，
 2:自己搭建的git服务器 则只对内访问,








 详细学习：
 */
