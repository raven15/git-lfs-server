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


## 参考资料

- https://github.com/git-lfs/lfs-test-server
- https://blog.unknowncat2048.top/posts/deploying-git-lfs-service-locally/
- https://www.jianshu.com/p/8cf806f3ab86
