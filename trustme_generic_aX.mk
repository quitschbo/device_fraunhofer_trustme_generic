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
   busybox \
   Launcher3 \
   ChromePublic \
   wpa_proxy \
   wifi_enable \
   sensors-client.default \
   gps-client.default \
   rilproxy \
   FDroid \
   OpenVPN \
   OpenConnect \
   TrustmeService \
   GmsCore

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
    trustme/build/device_provisioning/test_certificates/dev.user.adbkey.pub:root/adb_keys
endif

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1

#PRODUCT_COPY_FILES += \
#    device/fraunhofer/trustme_hammerhead_aX/trustme-bootanimation-1080.zip:system/media/bootanimation.zip

### overwrite ssh files
#PRODUCT_COPY_FILES += \
#   device/fraunhofer/trustme_hammerhead_aX/rootdir/system/bin/start-ssh:system/bin/start-ssh \
#   device/fraunhofer/trustme_hammerhead_aX/rootdir/system/etc/ssh/sshd_config:system/etc/ssh/sshd_config

# BW: revert to using vendor-provided *_supplicant_overlay.conf files without hardcoded network (fix TRUSTME-761)
#$(shell mkdir -p out/target/product/trustme_hammerhead_aX/system/etc/wifi/)
#$(shell cp device/fraunhofer/trustme_hammerhead_aX/wpa_supplicant_overlay.conf   out/target/product/trustme_hammerhead_aX/system/etc/wifi/)
#$(shell cp device/fraunhofer/trustme_hammerhead_aX/p2p_supplicant_overlay.conf   out/target/product/trustme_hammerhead_aX/system/etc/wifi/)

