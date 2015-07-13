cd bionic
git fetch ssh://shantur@review.cyanogenmod.org:29418/CyanogenMod/android_bionic refs/changes/43/92943/2 && git cherry-pick FETCH_HEAD
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

rebase hardware/libhardware https://github.com/UnORoms/android_hardware_libhardware.git
rebase external/bluetooth/bluedroid https://github.com/UnORoms/android_external_bluetooth_bluedroid.git
rebase packages/apps/Bluetooth https://github.com/UnORoms/android_packages_apps_Bluetooth.git
rebase frameworks/base https://github.com/UnORoms/android_frameworks_base.git
