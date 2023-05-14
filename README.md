#  ContentCachingInVM
Hook `runningInVM` method in AssetCache and AssetCacheManageService make Content Caching can running in VM.
Support macOS High Sierra 10.13.3 ~ Ventura 13.3.1

![](https://github.com/falafalafala1668/ContentCachingInVM/blob/master/Screenshots/s.gif)

## How To Do
### Install: 
1. Remember path of the patch dir.
![](https://github.com/falafalafala1668/ContentCachingInVM/blob/master/Screenshots/ins1.gif)
2. **Reboot VM to RecoveryOS**
3. Open Terminal and change Dir to the patch dir.
![](https://github.com/falafalafala1668/ContentCachingInVM/blob/master/Screenshots/ins3.gif)
4. Run `./RunMe.sh apply` or `./RunMe.sh apply <System Root>`(If your system root name is not Macintosh HD) 
![](https://github.com/falafalafala1668/ContentCachingInVM/blob/master/Screenshots/ins4.gif)
5. Turn ON Contant Caching in System Preferences.

### Uninstall: 
1. Remember path of the patch dir.
2. **Reboot VM to RecoveryOS**
3. Open Terminal and change Dir to the patch dir.
4. Run `./RunMe.sh restore` or `./RunMe.sh restore <System Root>`(If your system root name is not Macintosh HD) 

## Acknowledgement
[class-dump](https://github.com/nygard/class-dump)
[JRSwizzle](https://github.com/rentzsch/jrswizzle)

