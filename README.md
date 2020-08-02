#  ContentCachingInVM
Hook `runningInVM` method in AssetCache and AssetCacheManageService make Content Caching can running in VM.
Support macOS 10.13.3 to 11.0 Beta 3

## How To Do
1. **Please Disable SIP on your mac.**
2. Create new ``lib`` folder in``/usr/local/``
```
mkdir /usr/local/lib
```
3. Copy ``*.dylib`` to ``/usr/local/lib`` and copy ``*.plist`` to ``/System/Library/LaunchDaemons/`` in Files folder.
3. Restart your mac.
4. Turn ON Contant Caching in System Preferences.

## Acknowledgement
[class-dump](https://github.com/nygard/class-dump)
[JRSwizzle](https://github.com/rentzsch/jrswizzle)

