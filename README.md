#  ContentCachingInVM
Hook `runningInVM` method in AssetCache and AssetCacheManageService make Content Caching can running in VM.
Support macOS High Sierra 10.13.3 ~ Monterey 12.4

![](https://github.com/falafalafala1668/ContentCachingInVM/blob/master/Screenshot.png)

## How To Do
### Install: 
1. **Reboot VM to RecoveryOS**
2. Open Terminal and change Dir to this repo
3. Run `./RunMe.sh apply <System Root>` 
4. Restart your VM.
5. Turn ON Contant Caching in System Preferences.

### Uninstall: 
1. **Reboot VM to RecoveryOS**
2. Open Terminal and change Dir to this repo
3. Run `./RunMe.sh restore <System Root>`
4. Restart your VM.

## Acknowledgement
[class-dump](https://github.com/nygard/class-dump)
[JRSwizzle](https://github.com/rentzsch/jrswizzle)

