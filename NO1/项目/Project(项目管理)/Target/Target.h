
(C)target（决定产出什么产品）
0:(定义了构造一个product所需的文件和编译指令。一个target对应于一个product。）
   1:存在形式,各种平台IOS watchOS tvOS下的各种产品Application/Application Extension/Test/Framework & Library/）
   2:独特的各种配置
   3：最终产物product(每增加一个target 会为其将资源文件拷贝一份，但删除一个target不会同时删除当时拷贝的资源文件，疑问？target 与资源文件的关系在哪？)
