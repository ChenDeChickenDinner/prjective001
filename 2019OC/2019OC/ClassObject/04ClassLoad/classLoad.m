//
//  classLoad.m
//  2019OC
//
//  Created by xs on 2019/2/25.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "classLoad.h"

@implementation classLoad

@end
/**
 编译阶段
 类 类扩展
 a.每一个类都是  objc_class 的结构体(只读的成员变量 方法列表已经生产 在 class_ro_t * 中)
 b.类扩展的东西也是在编译阶段就合并添加到类的结构体中的
 分类
 a.每一个分类都是 category_t 的结构体
 b.此时分类的信息还未到类结构体中
 */
static void test0(){

}
/**
 运行阶段
 通过Runtime加载某个类的所有Category数据,把所有Category的方法、属性、协议数据，合并到一个大数组中
 1. 将合并后的分类数据（方法、属性、协议），插入到类原来数据的前面(添加到class_rw_t*中)
 2. 多个分类，将依次按照编译前后来合并，最后编译的最后整合 在最前面
 3. 导致 当多个分类的方法与原来相同的时候的方法调用问题(底层原理 是 消息机制的调用方法，以及方法的存放规则)
 */
static void test1(){

}


/**
 类 分类的 load
 1.调用时机:Runtime加载类,分类的时候调用，所有父类 子类 分类 都会调用
 2.调用方式:直接由系统通过方法地址调用，而不是消息机制的寻址方式
 3.调用顺序:循环遍历类的直接找到方法地址调用
 1.有继承关系:先父类 在子类
 2.无继承关系:按照编译先后顺序调用（先编译，先调用）
 3.有分类:先调用类的+load,再调用分类的+load
 4.多分类:按照编译先后顺序调用（先编译，先调用）
 */
static void test2(){

}
/**
 类 分类的 initialize
 +initialize方法会在类第一次接收到消息时调用

 调用顺序
 先调用父类的+initialize，再调用子类的+initialize
 (先初始化父类，再初始化子类，每个类只会初始化1次)

 +initialize是通过objc_msgSend进行调用的
 a.如果子类没有实现+initialize，会调用父类的+initialize（所以父类的+initialize可能会被调用多次）
 b.如果分类实现了+initialize，就覆盖类本身的+initialize调用

 */
static void test3(){

}
