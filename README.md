#  ContentCachingInVM
## Info
Hook ”runningInVM" method in AssetCache and AssetCacheManageService make Content Caching can running in VM.
Support macOS 10.13.3 to 10.14 (Beta 2)

## How To Do
1. **Please Disable SIP on your mac.**
2. Using **root** account for next step.
3. Copy ``*.dylib`` to ``/usr/local/lib`` and copy ``*.plist`` to ``/System/Library/LaunchDaemons/`` in Files folder.
4. Restart your mac.
5. Turn ON Contant Caching in System Preferences.
**DON'T ENABLE SIP!!!**

## Thanks
[class-dump](https://github.com/nygard/class-dump)  and [JRSwizzle](https://github.com/rentzsch/jrswizzle)

Twitter:[@SamuelCMian](https://twitter.com/SamuelCMian)
