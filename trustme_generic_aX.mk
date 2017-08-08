#
# This file is part of trust|me
# Copyright(c) 2013 - 2017 Fraunhofer AISEC
# Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2 (GPL 2), as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GPL 2 license for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Contact Information:
# Fraunhofer AISEC <trustme@aisec.fraunhofer.de>
#

PRODUCT_PACKAGES += \
   Launcher3 \
   WallpaperPicker \
   ChromePublic \
   sensors-client.default \
   gps-client.default \
   rilproxy \
   FDroid \
   OpenVPN \
   OpenConnect \
   Exchange2 \
   TrustmeService \
   GmsCore \
   GsfProxy \
   FakeStore \
   IchnaeaNlpBackend

# codeaurora and lineageos packages
PRODUCT_PACKAGES += \
   Eleven \
   SnapdragonGallery

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
    trustme/build/device_provisioning/test_certificates/dev.user.adbkey.pub:root/adb_keys
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1

#PRODUCT_COPY_FILES += \
#    device/fraunhofer/trustme_hammerhead_aX/trustme-bootanimation-1080.zip:system/media/bootanimation.zip
 
# set default permission for microg services (FAKE_SIGNATURE)
PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/aX/microg-permissions.xml:system/etc/default-permissions/microg-permissions.xml \
    device/fraunhofer/trustme_generic/aX/microg-sysconfig.xml:system/etc/sysconfig/microg-sysconfig.xml

# Overwrite disabled functions with empty xmls
PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.usb.host.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.nfc.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.wifi.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Copy trustme specific handheld_core_hardware.xml (e.g., removed camera and bluetooth)
PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/handheld_core_hardware.xml \
    device/fraunhofer/trustme_generic/trustme_generic_hardware.xml:system/etc/permissions/trustme_generic_hardware.xml

# enable ethernet
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

### overwrite ssh files
#PRODUCT_COPY_FILES += \
#   device/fraunhofer/trustme_hammerhead_aX/rootdir/system/bin/start-ssh:system/bin/start-ssh \
#   device/fraunhofer/trustme_hammerhead_aX/rootdir/system/etc/ssh/sshd_config:system/etc/ssh/sshd_config

# BW: revert to using vendor-provided *_supplicant_overlay.conf files without hardcoded network (fix TRUSTME-761)
#$(shell mkdir -p out/target/product/trustme_hammerhead_aX/system/etc/wifi/)
#$(shell cp device/fraunhofer/trustme_hammerhead_aX/wpa_supplicant_overlay.conf   out/target/product/trustme_hammerhead_aX/system/etc/wifi/)
#$(shell cp device/fraunhofer/trustme_hammerhead_aX/p2p_supplicant_overlay.conf   out/target/product/trustme_hammerhead_aX/system/etc/wifi/)


PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface= 
