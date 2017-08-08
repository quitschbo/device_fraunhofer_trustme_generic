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
DEVICE_PACKAGE_OVERLAYS += device/fraunhofer/trustme_generic/a0/overlay

PRODUCT_PACKAGES += \
   Launcher3 \
   WallpaperPicker \
   ChromePublic \
   sensors-client.default \
   FDroid \
   OpenVPN \
   OpenConnect \
   Exchange2 \
   TrustmeService \
   GmsCore \
   GsfProxy \
   FakeStore \
   IchnaeaNlpBackend

PRODUCT_PACKAGES += \
   TrustmeKeyguard \
   power-proxy \
   sensors-server \
   gps-server \
   resolv_sync

# codeaurora and lineageos packages
PRODUCT_PACKAGES += \
   Eleven \
   SnapdragonGallery

PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/a0/trustme-bootanimation-1080.zip:system/media/bootanimation.zip \
    device/fraunhofer/trustme_generic/a0/dnsmasq.conf:system/etc/dnsmasq.conf \

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
    trustme/build/device_provisioning/test_certificates/dev.user.adbkey.pub:root/adb_keys
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1

PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/empty.xml:system/etc/permissions/android.hardware.location.gps.xml

# set default permission for microg services (FAKE_SIGNATURE)
PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/aX/microg-permissions.xml:system/etc/default-permissions/microg-permissions.xml \
    device/fraunhofer/trustme_generic/aX/microg-sysconfig.xml:system/etc/sysconfig/microg-sysconfig.xml

### overwrite ssh files
#PRODUCT_COPY_FILES += \
#   device/fraunhofer/trustme_hammerhead_aX/rootdir/system/bin/start-ssh:system/bin/start-ssh \
#   device/fraunhofer/trustme_hammerhead_aX/rootdir/system/etc/ssh/sshd_config:system/etc/ssh/sshd_config

# BW: revert to using vendor-provided *_supplicant_overlay.conf files without hardcoded network (fix TRUSTME-761)
#$(shell mkdir -p out/target/product/trustme_hammerhead_aX/system/etc/wifi/)
#$(shell cp device/fraunhofer/trustme_hammerhead_aX/wpa_supplicant_overlay.conf   out/target/product/trustme_hammerhead_aX/system/etc/wifi/)
#$(shell cp device/fraunhofer/trustme_hammerhead_aX/p2p_supplicant_overlay.conf   out/target/product/trustme_hammerhead_aX/system/etc/wifi/)

