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

OUT_DIR := out-cml

##################################################
# Configure CML

PRODUCT_PACKAGES += \
	make_ext4fs_static \
	e2fsck_static \
	resize2fs_static \
	ip_static \
	iptables_static \
	cml-daemon \
	cml-control \
	cml-scd \
	toolbox_static \
	toybox_static \
	busybox-android \
	charger charger_res_images \
	dnsmasq_static \
	xattr_view \
	cml-run

ifneq ($(TRUSTME_HARDWARE), x86)
PRODUCT_PACKAGES += \
	stunnel \
	cml-panic \
	cml-logcat
else
PRODUCT_PACKAGES += \
	cml-tpm2d \
	tpm2-control \
	tpm2_simulator

#PRODUCT_PACKAGES += \
#	tpm2_powerup \
#	tpm2_startup \
#	tpm2_createprimary \
#	tpm2_create

endif

# no longer here, because we push the key to /data/misc/adb, which has to be done when we build
# the userdata image in trustme-main
#PRODUCT_COPY_FILES += \
#    trustme/build/device_provisioning/test_certificates/dev.user.adbkey.pub:root/adb_keys

PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_generic/cml/dnsmasq.conf:root/etc/dnsmasq.conf \
    device/fraunhofer/trustme_generic/cml/init.trustme_generic_cml_debug.rc:root/init.trustme_generic.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1

# Make sure init is built WITHOUT trustme changes
# Warning: changing these values does not trigger a rebuild of the corresponding module, e.g. init, so
# a clean could be necessary in between
TRUSTME_NATIVE := true
#ENABLE_LOG_UEVENTS := true

#TARGET_GLOBAL_CFLAGS += -DTRUSTME_NATIVE
#TARGET_GLOBAL_CPPFLAGS += -DTRUSTME_NATIVE

##################################################

PRODUCT_RUNTIMES := runtime_libart_default

$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)
