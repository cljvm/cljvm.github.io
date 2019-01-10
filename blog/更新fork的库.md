# 更新fork的库

1、把需要更新的fork库克隆到本地
git clone --depth 1 https://github.com/cljvm/shadowsocks-rust.git
cd shadowsocks-rust

2、使用 git remote -v 查询远程仓库
git remote -v
origin  https://github.com/cljvm/shadowsocks-rust.git (fetch)
origin  https://github.com/cljvm/shadowsocks-rust.git (push)

3、配置一个上游仓库
git remote add upstream https://github.com/shadowsocks/shadowsocks-rust.git

4、确认刚才添加的远程仓库
git remote -v
origin  https://github.com/cljvm/shadowsocks-rust.git (fetch)
origin  https://github.com/cljvm/shadowsocks-rust.git (push)
upstream        https://github.com/shadowsocks/shadowsocks-rust.git (fetch)
upstream        https://github.com/shadowsocks/shadowsocks-rust.git (push)

5、从上游仓库(upstream) fetch更新，并存储到本地分支的upstream/master
git fetch upstream
remote: Enumerating objects: 2698, done.
remote: Counting objects: 100% (2698/2698), done.
remote: Compressing objects: 100% (790/790), done.
Receiving objects:  97% (2552/2630), 652.00 KiB | 312.00 KiB/s   reused 0
Receiving objects: 100% (2630/2630), 700.94 KiB | 312.00 KiB/s, done.
Resolving deltas: 100% (1868/1868), completed with 55 local objects.
From https://github.com/shadowsocks/shadowsocks-rust
 * [new branch]      coio            -> upstream/coio
 * [new branch]      master          -> upstream/master
 * [new tag]         v1.7.0-alpha.17 -> v1.7.0-alpha.17
 * [new tag]         v1.7.0-alpha.10 -> v1.7.0-alpha.10
 * [new tag]         v1.7.0-alpha.12 -> v1.7.0-alpha.12
 * [new tag]         v1.7.0-alpha.13 -> v1.7.0-alpha.13
 * [new tag]         v1.7.0-alpha.14 -> v1.7.0-alpha.14
 * [new tag]         v1.7.0-alpha.15 -> v1.7.0-alpha.15

6、切换到本地主分支
git checkout master

7、将从上游仓库更新的文件合并到本地主分支
git merge upstream/master

8、更新到 GitHub 的 fork 上
git push origin master