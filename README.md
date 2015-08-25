# PrivateFramwork
iOS网络相关的第三方库

#ASIHttpRequst库
1.异步请求，使用的时MRC，因此ARC环境下需要混编设置
2.使用时，需要导入必要的系统框:CFNetwork.framwork/ SystemConfiguration.framwork/MobileCoreServices.framwork/coreCraphic
  s.framwork/libz.dylib/libxml2.dylib
  
#SDWebImage库
1.网络图片异步加载
2.MRC 因此在ARC环境下需要混编

#AFNetworking库
1.异步请求 使用时同时依赖newGata库  需要导入
2.使用时，需要导入必要的系统框架：   coreCraphis.framwork /libxml2.dylib
3.ARC  在ARC环境下直接使用，不需要混编
