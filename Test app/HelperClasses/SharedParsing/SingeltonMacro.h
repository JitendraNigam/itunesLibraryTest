//
//  SingeltonMacro.h
//  HorizontolScroll
//
//  Created by Jitendra Nigam on 05/09/16.
//  Copyright © 2016 Jitendra Nigam. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(classname)	\
\
+ (instancetype) shared##classname \



#define SINGLETON_FOR_CLASS(classname) \
\
+ (instancetype) shared##classname \
{ \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = [[self alloc] init]; \
}); \
return _sharedObject;\
}

