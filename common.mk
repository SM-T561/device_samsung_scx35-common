#
# Copyright (C) 2017 The LineageOS Project
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

LOCAL_PATH := device/samsung/scx35-common

# Inherit from AOSP product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sprd-common device configuration
$(call inherit-product, device/samsung/sprd-common/common.mk)

# setup dalvik vm configs
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.midi.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.live_wallpaper.xml

# Audio
PRODUCT_PACKAGES += \
    audio.primary.sc8830 \
    libaudio-resampler

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_hw.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_hw.xml \
    $(LOCAL_PATH)/configs/audio/audio_para:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_para \
    $(LOCAL_PATH)/configs/audio/audio_effects_vendor.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects_vendor.conf \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/codec_pga.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/codec_pga.xml \
    $(LOCAL_PATH)/configs/audio/tiny_hw.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/tiny_hw.xml

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_jni \
    bluetooth.default

# Codecs
PRODUCT_PACKAGES += \
    libcolorformat_switcher \
    libstagefrighthw \
    libstagefright_sprd_mpeg4dec \
    libstagefright_sprd_mpeg4enc \
    libstagefright_sprd_h264dec \
    libstagefright_sprd_h264enc \
    libstagefright_sprd_vpxdec \
    libstagefright_sprd_aacdec \
    libstagefright_sprd_mp3dec

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_telephony.xml

# Common libs
PRODUCT_PACKAGES += \
    libstlport \
    librilutils \
    libril_shim \
    libgps_shim

# Camera
PRODUCT_PACKAGES += \
    Snap

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# GPS
PRODUCT_PACKAGES += \
    libgpspc \
    libefuse

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.xml

# HWC
PRODUCT_PACKAGES += \
    libHWCUtils \
    gralloc.sc8830 \
    libmemoryheapion \
    libion_sprd

# Rootdir
PRODUCT_PACKAGES += \
    init.board.rc \
    init.wifi.rc \
    at_distributor.rc \
    chown_service.rc \
    data.rc \
    dns.rc \
    engpc.rc \
    gpsd.rc \
    hostapd.rc \
    kill_phone.rc \
    macloader.rc \
    mediacodec.rc \
    modem_control.rc \
    modemd.rc \
    nvitemd.rc \
    p2p_supplicant.rc \
    phoneserver.rc \
    refnotify.rc \
    set_mac.rc \
    smd_symlink.rc \
    swap.rc \
    wpa_supplicant.rc

# Lights
PRODUCT_PACKAGES += \
    lights.sc8830

# PowerHAL
PRODUCT_PACKAGES += \
    power.sc8830

# Camera config
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1

# Wifi
PRODUCT_PACKAGES += \
    macloader \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/wifi/wpa_supplicant_overlay.conf

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog

# Performance
PRODUCT_PROPERTY_OVERRIDES += \
    sys.use_fifo_ui=1
