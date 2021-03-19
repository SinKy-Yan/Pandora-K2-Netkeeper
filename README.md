# 简介

首先,这个是使用[miao1007的轮子](https://github.com/miao1007/Openwrt-NetKeeper/tree/master/netkeeper4-use-pppoer-server)来拦截客户端发送给拨号服务器的账号密码,然后再用这个账号密码在路由器上使用pppoe拨号;然后这个脚本似乎在`Pandora`上运行的最好,所以我这里已经准备好了两个适用于搭载了`mt7620`核心的路由器的固件,当然我这里用的是斐讯K2(非K2G或K2T或K2P,似乎K1也用的是mt7620,但没测试)然后其它固件的话,比如那个`openwrt`我试过官方编译好的and自己用官方源码编译的and自己用lean大佬的源码编译的,都试过了,效果都不如这个好

[![6WlQg0.png](https://s4.ax1x.com/2021/03/19/6WlQg0.png)](https://imgtu.com/i/6WlQg0)

[![6WlM3q.png](https://s4.ax1x.com/2021/03/19/6WlM3q.png)](https://imgtu.com/i/6WlM3q)

> 我认为现在几乎所有破解校园网都是基于他的这个方法,respect

# 破解

## 安装固件

首先去`固件`文件夹内把固件装好;

## 安装ipk

然后把`WinSCP`装好,用`WinSCP`把`root`和`tmp`下面的文件传到相应的文件夹下,注意不是`/root`目录;

然后用你电脑上的`终端`ssh连到路由器,进入`tmp`文件夹下去安装三个`ipk`,**一定按顺序安装**;

```shell
opkg install libssp.ipk
opkg install rp-pppoe-common.ipk
opkg install rp-pppoe-server.ipk
```

## 运行脚本

ssh不用退出,继续运行,任意目录运行都可

```shell
sh /root/nk4conf.sh
```

然后把电源拔了重启路由器;

## 拨号

拨号即可,netkeeper提示错误691之后等一会应该就可以了,有什么问题提issue