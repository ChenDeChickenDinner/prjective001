/*
1:target dependencies（target依赖关系）
这里会告诉 build 系统，build 当前的 target 之前，必须先对这里的依赖性进行 build。


PBXContainerItemProxy（目标对象的容器）
55E4CA992092C8EF00E56EDE = {
    isa = PBXContainerItemProxy;
    containerPortal = 55744D24208F0CFD00DC86F6 /Project object /;
    proxyType = 1;
    remoteGlobalIDString = 55744D2B208F0CFD00DC86F6; //
    remoteInfo = one;
};


 PBXTargetDependency(一个依赖对象)
 55E4CA9A2092C8EF00E56EDE = {
     isa = PBXTargetDependency;
     target = 55744D2B208F0CFD00DC86F6 //:引用哪个target
 targetProxy = 55E4CA992092C8EF00E56EDE / PBXContainerItemProxy /; //:目标容器是哪个
 };


 PBXNativeTarget/dependencies(数组:55E4CA9A2092C8EF00E56EDE / PBXTargetDependency /)

*/


