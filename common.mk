#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# AAPT config (Screen Density)
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay/lineage-sdk

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# Overlays - override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default

#CNE
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Doze
PRODUCT_PACKAGES += \
    XiaomiDoze

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.manager-V1.0-java \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhwbinder

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims-ext-common_system

# init
PRODUCT_PACKAGES += \
    init.qcom.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.xiaomi_sdm439

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.ims.xml

# Properties
-include $(LOCAL_PATH)/vendor_props.mk

# RCS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

# Shims
PRODUCT_PACKAGES += \
    libcutils_shim \
    libqsapshim
    
# Secure Lock
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/securelock.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/securelock.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service.xiaomi_sdm439

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.xiaomi_sdm439

# VNDK
PRODUCT_PACKAGES += \
    vndk_package

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

# Call proprietary blobs setup
$(call inherit-product-if-exists, vendor/xiaomi/sdm439-common/sdm439-common-vendor.mk)
