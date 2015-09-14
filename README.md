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

#AFAppDotNetAPIClient 是对AFNetworking的封装的单利 使用方法：

[[AFAppDotNetAPIClient sharedClient] GET:url parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject){
    //数据请求成功
} failure:^(NSURLSessionDataTask *task, NSError *error)
{
    //数据请求失败
}];

#POST请求/GET请求案例
分别使用NSURLConnection ,ASI,AFN 实现GET / POST 请求的案例
使用AFN的请求，可以使用案例7中封装号的网络模块



#手动代码中进行界面适配库 “Masonry”
ARC环境下使用即可 Masonry.h包含所有类的头文件引用 使用时在pch文件中引用该文件即可

使用举例：

[_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
make.left.equalTo(superView.mas_left).offset(10);
make.top.equalTo(superView.mas_top).offset(5);
make.right.equalTo(superView.mas_right).offset(-5);
make.height.equalTo(view.mas_height).multipliedBy(1/2.0);
}];


#MagicalRecord sqlit数据库操作封装的第三方库 使用方法见“美食屋”项目
