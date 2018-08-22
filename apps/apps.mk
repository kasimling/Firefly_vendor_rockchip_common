

PRODUCT_PACKAGES += \
    Gallery2	\
    RkApkinstaller	\
    QuickSearchBox	\
    DocumentsUI \
    DownloadProviderUi \
    Rk4kVideoPlayer \
    Music \
    RKUpdateService

PRODUCT_COPY_FILES += \
	vendor/rockchip/common/apps/DeviceTest/lib/vm:system/xbin/vm \
	vendor/rockchip/common/apps/DeviceTest/lib/systemconfig:system/bin/systemconfig \
	vendor/rockchip/common/apps/DeviceTest/lib64/libserial_port.so:system/lib64/libserial_port.so \
	vendor/rockchip/common/apps/DeviceTest/lib/libserial_port.so:system/lib/libserial_port.so \
	vendor/rockchip/common/apps/DeviceTest/lib64/libdrm_devicetest.so:system/lib64/libdrm_devicetest.so \
	vendor/rockchip/common/apps/DeviceTest/lib/libdrm_devicetest.so:system/lib/libdrm_devicetest.so
	
ifeq ($(strip $(TARGET_BOARD_HARDWARE)), rk30board)
ifeq ($(strip $(TARGET_ARCH)), arm)
PRODUCT_COPY_FILES += \
       vendor/rockchip/common/apps/RKUpdateService/lib/arm/librockchip_update_jni.so:system/lib/librockchip_update_jni.so
else ifeq ($(strip $(TARGET_ARCH)), arm64)
PRODUCT_COPY_FILES += \
       vendor/rockchip/common/apps/RKUpdateService/lib/arm/librockchip_update_jni.so:system/lib/librockchip_update_jni.so \
       vendor/rockchip/common/apps/RKUpdateService/lib/arm64/librockchip_update_jni.so:system/lib64/librockchip_update_jni.so
endif
endif

ifneq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), vr)
PRODUCT_PACKAGES += \
    userExperienceService
ifneq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), box)
PRODUCT_PACKAGES += \
    MediaFloat      \
    RkApkinstaller \
    Lightning
endif

#ifeq ($(strip $(TARGET_BOARD_PLATFORM)), rk3288)
#PRODUCT_PACKAGES += \
#    WinStartService \
#    projectX
#endif

ifneq ($(filter rk312x rk3126c, $(TARGET_BOARD_PLATFORM)), )
PRODUCT_PACKAGES += \
    RkVideoPlayer
else
ifeq ($(strip $(PRODUCT_BUILD_MODULE)), px5car)
PRODUCT_PACKAGES += \
	Rk3grVideoPlayer
else
ifneq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), box)
PRODUCT_PACKAGES += \
    Rk4kVideoPlayer
endif
endif
endif
endif

ifeq ($(strip $(PRODUCT_BUILD_MODULE)), px5car)
PRODUCT_PACKAGES += \
    Rk3grExplorer
else
PRODUCT_PACKAGES += \
    RkExplorer
endif


ifeq ($(strip $(BOARD_HAS_STRESSTEST_APP)), true)
    PRODUCT_PACKAGES += \
    StressTest \
    DeviceTest
endif

##################for vr app#####################
ifeq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), vr)
PRODUCT_PACKAGES += \
		RockVRHome	\
		RKVRSettings	\
		RKVRExplorer	\
		RKVRGlobalActions	\
                RKVRPanorama	\
		RKVRPlayer	
endif

###########for box app ################
ifeq ($(strip $(TARGET_BOARD_PLATFORM_PRODUCT)), box)
PRODUCT_PACKAGES += \
    MediaCenter \
    PinyinIME \
    rkmcapp-armeabi-v7a-debug \
    ChangeLedStatus \
    WifiDisplay \
    RKDeviceTest \
	Lightning \
	DLNA \
    SoundRecorder \
    Launcher3  \
    DeviceTest
  ifeq ($(strip $(BOARD_USE_LOW_MEM256)), true)
#        PRODUCT_PACKAGES += \
#              SimpleLauncher
  endif
endif
