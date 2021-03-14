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

BOARD_VENDOR := xiaomi

COMMON_PATH := device/xiaomi/sdm439-common

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM :=true
BLUETOOTH_HCI_USE_MCT := true
TARGET_USE_QTI_BT_STACK := true

# Board
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := QC_Reference_Phone
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno505

# Build
BUILD_BROKEN_DUP_RULES := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO

# Dex-preopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
    endif
  endif
endif

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Display
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

#FM
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8
BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7824900.sdhci androidboot.usbconfigfs=true androidboot.selinux=permissive androidboot.configfs=true
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1 earlycon=msm_hsl_uart,0x78B0000 vmalloc=300M firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
TARGET_COPY_OUT_VENDOR := vendor
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
#BUILD_WITHOUT_VENDOR := true
BOARD_ROOT_EXTRA_SYMLINKS := \
    /vendor/firmware_mnt:/firmware \
    /mnt/vendor/persist:/persist

# Power
TARGET_USES_INTERACTION_BOOST := true
TARGET_TAP_TO_WAKE_NODE := "/dev/input/event1"

# Props
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)

# RIL
TARGET_PROVIDES_QTI_TELEPHONY_JAR := true

# SELinux
SELINUX_IGNORE_NEVERALLOWS := true
SELINUX_IGNORE_NEVERALLOWS_ON_USER := true
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/qcom/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += device/qcom/sepolicy/public
BOARD_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/temp

# VNDK
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_SYSTEMSDK_VERSION := 29

# Inherit proprietary version
-include vendor/xiaomi/sdm439-common/BoardConfigVendor.mk
