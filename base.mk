#Huawei devices don't declare fingerprint and telephony hardware feature
#TODO: Proper detection
PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

#Use a more decent APN config
PRODUCT_COPY_FILES += \
	device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += device/phh/treble/sepolicy
DEVICE_PACKAGE_OVERLAYS += device/phh/treble/overlay

$(call inherit-product, vendor/hardware_overlay/overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

#Those overrides are here because Huawei's init read properties
#from /system/etc/prop.default, then /vendor/build.prop, then /system/build.prop
#So we need to set our props in prop.default
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
	ro.build.version.security_patch=$(PLATFORM_SECURITY_PATCH) \
	ro.build.version.sdk=$(PLATFORM_SDK_VERSION)
