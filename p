cd vendor/cm
git fetch http://review.cyanogenmod.org/CyanogenMod/android_vendor_cm refs/changes/36/111336/18 && git cherry-pick FETCH_HEAD
cd -

cd hardware/libhardware
git fetch http://review.cyanogenmod.org/CyanogenMod/android_hardware_libhardware refs/changes/54/112454/3 && git cherry-pick FETCH_HEAD
cd -

cd hardware/libhardware_legacy
git fetch ssh://shantur.rathore@review.cyanogenmod.org:29418/CyanogenMod/android_hardware_libhardware_legacy refs/changes/68/113268/2 && git cherry-pick FETCH_HEAD
cd -

cd frameworks/opt/telephony
git fetch ssh://shantur.rathore@review.cyanogenmod.org:29418/CyanogenMod/android_frameworks_opt_telephony refs/changes/81/114381/1 && git cherry-pick FETCH_HEAD
git fetch ssh://shantur.rathore@review.cyanogenmod.org:29418/CyanogenMod/android_frameworks_opt_telephony refs/changes/82/114382/1 && git cherry-pick FETCH_HEAD
cd -

cd system/core
git fetch ssh://shantur.rathore@review.cyanogenmod.org:29418/CyanogenMod/android_system_core refs/changes/83/114383/1 && git cherry-pick FETCH_HEAD
cd -

cd frameworks/native
git fetch ssh://shantur.rathore@review.cyanogenmod.org:29418/CyanogenMod/android_frameworks_native refs/changes/32/114332/1 && git cherry-pick FETCH_HEAD
cd -


rebase() {
    
    local dir=$1
    local repourl=$2

    cd $dir 
    git remote add gh $repourl
    git fetch gh
    git rebase HEAD gh/cm-12.1
    if [ $? -eq 0 ]; then
        echo OK
	git push -f gh gh/cm-12.1:refs/heads/cm-12.1-fm
	git push -f gh HEAD:refs/heads/cm-12.1
    else
        echo FAIL to rebase $dir
    fi
    cd -
}

#rebase hardware/libhardware https://github.com/UnORoms/android_hardware_libhardware.git
#rebase external/bluetooth/bluedroid https://github.com/UnORoms/android_external_bluetooth_bluedroid.git
#rebase packages/apps/Bluetooth https://github.com/UnORoms/android_packages_apps_Bluetooth.git
#rebase frameworks/base https://github.com/UnORoms/android_frameworks_base.git
