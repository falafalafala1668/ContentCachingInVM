//
//  HookAssetCacheManagerServices.m
//  HookAssetCacheManagerServices
//
//  Created by Mianmian on 12/6/2018.
//  Copyright © 2018 Mianmian. All rights reserved.
//

#import "HookAssetCacheManagerService.h"
#import "ACClasses.h"

@implementation NSObject (hook)
#pragma mark - ACMSManager
- (BOOL)hook_runningInVM {
    NSLog(@"++++++++ AssetCacheManagerService:Hooked RunningInVM:%@ ++++++++",[self hook_runningInVM] ? @"Yes" : @"No");
    return NO;
}

static void __attribute__((constructor)) initialize(void) {
    NSLog(@"++++++++ AssetCacheManagerService:loaded ++++++++");
    //   CBHookClassMethod();
    CBHookInstanceMethod(ACMSManager, @selector(runningInVM), @selector(hook_runningInVM));
}

@end
