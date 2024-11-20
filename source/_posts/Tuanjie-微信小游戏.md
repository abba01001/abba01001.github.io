---
title: Hello World
date: 2024-11-21 00:00:00
author: abba01001
categories: Tuanjie
---
<div style="text-align: center; font-size: 40px; font-weight: bold;">
  切换微信小游戏平台问题记录
</div>



#### 1.切换平台后，hybridclr热更框架不支持。

将hybridclr插件升至最新版本。升完后需要清理下缓存，将项目里的Library和obj文件夹删掉，再打开项目

![](https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/BlogData/Image/202411210004662.png)



### 2.编译Generate/All报错。

<command line>:12:9: note: previous definition is here #define SLIM_GLOBAL_METADATA_FILE 1        ^ 1 warning and 1 error generated.

1.2.1以上团结引擎取消勾选Use Slim Format For global-metadata.dat![](https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/BlogData/Image/202411210009848.png)

在HybridCLRData\LocalIl2CppData-WindowsEditor\il2cpp\libil2cpp\il2cpp-config.h找到
\#define SLIM_GLOBAL_METADATA_FILE 1
将其改为\#define SLIM_GLOBAL_METADATA_FILE 0

#### 3.编辑器拓展里默认序列化的Enum报错。

```
public enum CusBuildTarget
{
    Windows,
    Android,
    IOS,
    WeiXinMiniGame
}
public CusBuildTarget CurrBuildTarget;
```

可以加上第三方插件的序列化
如下:

```
[EnumPaging]
public CusBuildTarget CurrBuildTarget;
```

#### 4.WebGl并不支持MySql(MySql写道后台,后台去访问Mysql返回结果给客户端)

#### 5.本地http://localhost:8000中测试微信小游戏的 WebGL,访问Cos出现CORS（跨域资源共享）问题

Access to fetch at 'https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/APK/APKVersion.txt' from origin 'http://localhost:8000' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. If an opaque response serves your needs, set the request's mode to 'no-cors' to fetch the resource with CORS disabled.

解决：

![](https://abab01001-1318826377.cos.ap-guangzhou.myqcloud.com/BlogData/Image/202411210016289.png)
