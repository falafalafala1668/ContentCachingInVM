//
//  CrackAssetCache.m
//  CrackAssetCache
//
//  Created by Mianmian on 12/6/2018.
//  Copyright © 2018 Mianmian. All rights reserved.
//

#import "CrackAssetCache.h"
#import "ACClasses.h"

@implementation NSObject (hook)
#pragma mark - ECConfig
- (BOOL)hook_runningInVM {
    NSLog(@"++++++++ AssetCache:Hooked RunningInVM:%@ ++++++++",[self hook_runningInVM] ? @"Yes" : @"No");
    return NO;
}

static void __attribute__((constructor)) initialize(void) {
    NSLog(@"++++++++ AssetCache:loaded ++++++++");
    //    CBHookClassMethod();
    CBHookInstanceMethod(ECConfig, @selector(runningInVM), @selector(hook_runningInVM));
}


@end
