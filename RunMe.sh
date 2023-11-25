#!/bin/bash 
[ -z "${1}" ] && echo "./RunMe.sh apply|restore <System Root>" && exit
[ -z "${2}" ] && ROOT="/Volumes/Macintosh HD" || ROOT="${2}"

[ ! -e "${ROOT}/System/Library" ] && echo "Not System Root" && exit
export PATH="${ROOT}"/usr/bin:$PATH

cd "$(dirname "$0")"

ull="usr/local/lib"
SLL="System/Library/LaunchDaemons"
SYSVER="$(sw_vers -productVersion)"
# FS="$(df "${ROOT}" | grep /dev)"
LDAC="${SLL}/com.apple.AssetCache.builtin.plist"
LDACM="${SLL}/com.apple.AssetCacheManagerService.plist"

rwroot() {
    mount -uw "${ROOT}"
}

ssv() {
    [ "$(uname -m)" = "arm64" ] && bputil -s || ([ "${SYSVER%.*}" = "10.15" ] || [ "${SYSVER%%.*}" -ge 11 ]) && csrutil authenticated-root ${1}
}

newSnapShot() {
    [ "${SYSVER%%.*}" -ge 11 ] && {
        if [ "$(uname -m)" = "arm64" ]; then 
            bless --mount "${ROOT}/System/Library/CoreServices" --setBoot --create-snapshot
        else
            bless --folder "${ROOT}/System/Library/CoreServices" --bootefi --create-snapshot
        fi
    }
}

case "${1}" in
"apply")
    if [ ! -f "/usr/bin/nano" ]; then
        csrutil enable --without fs --without debug && {
            ssv disable
            rwroot
            [ ! -d "${ROOT}/${ull}" ] && mkdir -p "${ROOT}/${ull}"
            cp Files/libHookAssetCache* "${ROOT}/${ull}"
            defaults write "${ROOT}/${LDAC}" "EnvironmentVariables" -dict-add "DYLD_INSERT_LIBRARIES" "/usr/local/lib/libHookAssetCache.dylib"
            defaults write "${ROOT}/${LDACM}" "EnvironmentVariables" -dict-add "DYLD_INSERT_LIBRARIES" "/usr/local/lib/libHookAssetCacheManagerService.dylib"
            chmod 0644 "${ROOT}/${LDAC}" 
            chmod 0644 "${ROOT}/${LDACM}"
            newSnapShot
            echo "Rebooting VM"
            reboot
        }
    else
        echo "Not RecoveryOS"
    fi
    ;;

"restore")
    if [ ! -f "/usr/bin/nano" ]; then 
        rwroot
        rm "${ROOT}"/${ull}/libHookAssetCache*
        defaults delete "${ROOT}/${LDAC}" "EnvironmentVariables"
        defaults delete "${ROOT}/${LDACM}" "EnvironmentVariables"
        chmod 0644 "${ROOT}/${LDAC}" 
        chmod 0644 "${ROOT}/${LDACM}"
        newSnapShot
        csrutil enable
        echo "Rebooting VM"
        reboot
    else
        echo "Not RecoveryOS"
    fi
    ;;
"build")
    xcodebuild -alltargets && {
        cp build/Release/libHook*.dylib Files
        rm -rf build
    }
    ;;
*)
    echo "./RunMe.sh apply|restore [System Root]"
    ;;
esac
