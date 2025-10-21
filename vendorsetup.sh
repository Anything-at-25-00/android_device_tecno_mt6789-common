#!/bin/bash

RET=0
echo "- Applying fenrir compatiblity patches"
cd system/core
curl https://github.com/Nothing-2A/android_system_core/commit/8ff6e7a68523c3b870d8dcd5713c71ea15b43dd2.patch | git am || {
  RET=$?
  git am --abort >/dev/null 2>&1
}
curl https://github.com/Nothing-2A/android_system_core/commit/0d5990a96c5e6a404887f5575c5d00bcbbaaef74.patch | git am || {
  RET=$?
  git am --abort >/dev/null 2>&1
}
cd ../../

echo "- Applying Aperture Mediatek HFPS Mode Patch"
cd packages/apps/Aperture
curl https://github.com/Nothing-2A/android_packages_apps_Aperture/commit/9509277efc852ad8bdcce204e0d9cfe104b6d190.patch | git am || {
  RET=$?
  git am --abort >/dev/null 2>&1
}
cd ../../../

if [ $RET -ne 0 ]; then
  echo "ERROR: Patch is not applied! Maybe it's already patched, or you'll have to adapt it to this specific rom source?"
else
  echo "OK: All patched"
fi
