LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    org_omnirom_asusec_KeyHandler.cpp \
    org_omnirom_asusec_DockEmbeddedController.cpp \
    org_omnirom_asusec_AsusecNative.cpp

LOCAL_C_INCLUDES += \
    $(JNI_H_INCLUDE)

LOCAL_SHARED_LIBRARIES := \
    libandroid_runtime \
    libnativehelper \
    libcutils \
    libutils

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libasusec_jni

include $(BUILD_SHARED_LIBRARY)
