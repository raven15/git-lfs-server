# git-lfs-server

自建 git-lfs 服务器维护相关工具。

## for windows

``` cmd
go install github.com/git-lfs/lfs-test-server@latest
.\lfs-test-server.cmd --admin
# 浏览器打开 http://127.0.0.1:8080/mgmt 进入后台管理
```

`unix2dos.exe .gitignore`

``` bash
# cd git-repo-dir
# git lfs init or git lfs install
git lfs track "*.zip"
git add .
git lfs ls-files
git lfs status
git commit -m "add large files."

# 也支持为某个远端单独配置
git config lfs.url "http://127.0.0.1:8080/info/lfs"
# 仅推送全部 lfs 文件到服务器，不推送 git 记录
git push origin master -a

# 如果服务器是非公开的，开启了身份验证，例如 base 模式，需要在后台添加用户和密码，
git 客户端需要配置验证程序，或使用的时候提示输入用户名密码。
```

```
$env:GIT_LFS_SKIP_SMUDGE=1
git clone ./git-repo-dir/.git ./x
or
GIT_LFS_SKIP_SMUDGE=1 git -c filter.lfs.smudge= -c filter.lfs.required=false clone ./git-repo-dir/.git ./s
git lfs ls-files
git lfs status

cat 2.jar                                                                                                          ─╯
version https://git-lfs.github.com/spec/v1
oid sha256:b4e49dccb171bc427d2d7962c1fa2c32481cad02ecad6eea0d2f2fae03f34282
size 23341161

git lfs fetch
git lfs checkout
```

```
go install github.com/br0xen/boltbrowser@latest
boltbrowser lfs.db
```


## docker


## 

```
这会禁用（客户端）的pre-push hook，但不会禁用（服务器端）的pre-receive hook。大多数Git服务器（例如GitLab）都实现了这样一个hook来检查丢失的LFS对象。

用github 做实验，github 如果一个仓库提交过lfs文件就会启用这个钩子，再次提交的时候如果lfs文件没有上传就会出错。
所以删除仓库后，重新建了一个同名仓库。再次上传，使用不上传 lfs 参数或者使用私有 lfs 服务器，就会通过。

gitee 免费版不支持lfs 可以直接提交。

git push --no-verify github github:main 
Uploading LFS objects: 100% (2/2), 263 MB | 0 B/s, done.
枚举对象中: 15, 完成.
对象计数中: 100% (15/15), 完成.
使用 14 个线程进行压缩
压缩对象中: 100% (12/12), 完成.
写入对象中: 100% (13/13), 2.01 KiB | 686.00 KiB/s, 完成.
Total 13 (delta 4), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (4/4), completed with 1 local object.
remote: error: GH008: Your push referenced at least 2 unknown Git LFS objects:
remote:     b42980bf0c920af7cd25df7d9e1cf2c2cef5eb466ce692451596ce34e0d90c21
remote:     8683cdc3d6c029b49393dcebbaa6265bd6efd9abdcf837be855b4cd42e5e80b6
remote: Try to push them with 'git lfs push --all'.
To github.com:raven15/software.git
 ! [remote rejected] github -> main (pre-receive hook declined)
错误：无法推送一些引用到 'github.com:raven15/software.git'
```

## 参考资料

- https://github.com/git-lfs/lfs-test-server
- https://blog.unknowncat2048.top/posts/deploying-git-lfs-service-locally/
- https://www.jianshu.com/p/8cf806f3ab86
