
CUR_PATH := vendor/rockchip/common

#########################################################
#   3G Dongle SUPPORT
#########################################################
PRODUCT_COPY_FILES += \
    $(CUR_PATH)/phone/etc/ppp/ip-down:system/etc/ppp/ip-down-ppp0 \
    $(CUR_PATH)/phone/etc/ppp/ip-up:system/etc/ppp/ip-up-ppp0 \
    $(CUR_PATH)/phone/etc/ppp/call-pppd:system/etc/ppp/call-pppd \
    $(CUR_PATH)/phone/etc/ppp/init.gprs-pppd:system/etc/ppp/init.gprs-pppd \
    $(CUR_PATH)/phone/etc/ppp/signal_ppp_dialer:system/etc/ppp/signal_ppp_dialer \
    $(CUR_PATH)/phone/bin/chat:system/bin/chat \
    $(CUR_PATH)/phone/bin/usb_modeswitch:system/bin/usb_modeswitch \
    $(CUR_PATH)/phone/etc/operator_table:system/etc/operator_table 

PRODUCT_COPY_FILES += \
    $(CUR_PATH)/phone/lib/libril-rk29-dataonly.so:system/lib/libril-rk29-dataonly.so \
    $(CUR_PATH)/phone/lib/libreference-ril.so:system/lib/libreference-ril.so


ifeq ($(strip $(PRODUCT_MODEM)), DTS4108C)
PRODUCT_COPY_FILES += \
    $(CUR_PATH)/phone/bin/rild_dts4108c:system/bin/rild \
    $(CUR_PATH)/phone/lib/libreference-ril-dts4108c.so:system/lib/libreference-ril.so \
    $(CUR_PATH)/phone/lib/libril-dts4108c.so:system/lib/libril.so
endif

ifeq ($(strip $(BOARD_HAVE_DONGLE)),true)
PRODUCT_PACKAGES += \
    rild \
    libril-rk29-dataonly \
    usb_modeswitch \
    chat

PRODUCT_PROPERTY_OVERRIDES +=ro.boot.noril=false
else
PRODUCT_PROPERTY_OVERRIDES +=ro.boot.noril=true
endif


PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=true \
	ril.function.dataonly=1
