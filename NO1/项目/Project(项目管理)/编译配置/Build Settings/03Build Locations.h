
(2)-->Build Locations -- 编译目录(文件目录)

1.1:Build Products Path 产品文件和编译中间文件的根目录。产品文件和编译时临时文件都将放在这个目录的子目录中。 （SYMROOT = build）
/Users/xs/Library/Developer/Xcode/DerivedData/chende-euyiiuuuyvkpjlgddujmaulvqxsc/Build（一个product）


1.2:Intermediate Build Files Path  ( OBJROOT = $(SYMROOT) )
编译时临时文件的存放位置。编译中间文件格式为product name+.build，如MyProduct.build。

2.1:Per-configuration Build Product Path (CONFIGURATION_BUILD_DIR = )
当前编译设置下的产品存放位置

2.2:Per-configuration Intermediate File Path
当前编译设置下编译时临时文件的存放位置(CONFIGURATION_TEMP_DIR =  OBJROOT /...)


3:Precompiled Headers Cache Path （SHARED_PRECOMPS_DIR =  OBJROOT /...）
存放预编译头文件的位置。通过这个配置，Targets可以互相共享预编译的头文件
