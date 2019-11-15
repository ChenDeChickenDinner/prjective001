//
//  Define.c
//  CGrammar
//
//  Created by xs on 2019/4/22.
//  Copyright © 2019 xs. All rights reserved.
//

#include "Define.h"


/*条件编译
 
 */

#define sunshu 10


#if defined(sunshu)
#endif
#ifdef sunshu
#endif



#if !defined(sunshu)
#endif
#ifndef sunshu
#endif

//  == != && || > < 支持所有的逻辑操作符
#if sunshu < 10

#elif sunshu == 10

#else

#endif
