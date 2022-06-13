//
//  hook.h
//  HookVM
//
//  Created by Mianmian on 12/6/2018.
//  Copyright © 2018 Mianmian. All rights reserved.
//

#ifndef hook_h
#define hook_h

#import <Cocoa/Cocoa.h>
#import "JRSwizzle.h"

//! Project version number for hook.
FOUNDATION_EXPORT double hookVersionNumber;

//! Project version string for hook.
FOUNDATION_EXPORT const unsigned char hookVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <hook/PublicHeader.h>


#define CBGetClass(classname) objc_getClass(#classname)
#define CBRegisterClass(superclassname, subclassname) { Class class = objc_allocateClassPair(CBGetClass(superclassname), #subclassname, 0);objc_registerClassPair(class); }
#define CBHookInstanceMethod(classname, ori_sel, new_sel) { NSError *error; [CBGetClass(classname) jr_swizzleMethod:ori_sel withMethod:new_sel error:&error]; if(error) NSLog(@"%@", error); }
#define CBHookClassMethod(classname, ori_sel, new_sel) { NSError *error; [CBGetClass(classname) jr_swizzleClassMethod:ori_sel withClassMethod:new_sel error:&error]; if(error) NSLog(@"%@", error); }
#define CBGetInstanceValue(obj, valuename) object_getIvar(obj, class_getInstanceVariable([obj class], #valuename))
#define CBSetInstanceValue(obj, valuename, value) object_setIvar(obj, class_getInstanceVariable([obj class], #valuename), value)

#endif /* hook_h */
