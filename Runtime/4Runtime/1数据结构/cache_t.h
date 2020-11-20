//
//  cache_t.h
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface cache_t : NSObject

@end
/*
散列表的实现过程（空间换时间)（参数&value=index）
1.存入的时候 以 SEL做为key 通过算法 得出一个index,直接存入对应的位置
2.取出的时候 直接 以SEL(key) 通过算法 得出一个index，取出对应的imp

方法缓存的逻辑
1.父类的方法也很缓存到子类的缓存列表中
2.扩容，会清空缓存
struct bucket_t {
    cache_key_t _key; //SEL做为key
    IMP _imp; //方法地址
}
struct cache_t {
    struct bucket_t *_buckets; // 散列表
    mask_t _mask; // 散列表的长度-1
    mask_t _occupied; //已经缓存的方法数量
}
*/
