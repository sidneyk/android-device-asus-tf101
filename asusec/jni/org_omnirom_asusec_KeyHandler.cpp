/*
 * Copyright (C) 2013 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "AsusecKeyHandler"

#include "JNIHelp.h"
#include "jni.h"
#include <utils/Log.h>
#include <utils/misc.h>

#include <android_runtime/AndroidRuntime.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/ioctl.h>

namespace asusec {

// intentionally asusEC (no d/dec) for tf101
#define ASUSEC_DEV "/dev/asusec"

// copied from drivers/input/asusec/asusec.h
#define ASUSEC_TP_ON   1
#define ASUSEC_TP_OFF  0
#define ASUSEC_IOC_MAGIC   0xf4
#define ASUSEC_TP_CONTROL      _IOR(ASUSEC_IOC_MAGIC, 5,  int)


JNIEXPORT jboolean JNICALL asusec_KeyHandler_nativeToggleTouchpad
  (JNIEnv *env, jclass cls, jboolean status) {
    ALOGD("Switching touchpad %d\n", status);

    int fd = open(ASUSEC_DEV, O_RDONLY | O_NONBLOCK);

    if (fd < 0) {
        ALOGE("Could  open device %s\n", ASUSEC_DEV);
        return -1;
    }

    int on = (status == 0) ? ASUSEC_TP_OFF : ASUSEC_TP_ON;
    int success = ioctl(fd, ASUSEC_TP_CONTROL, on);

    if (success != 0) {
        ALOGE("Error calling ioctl, %d\n", success);
    }

    close(fd);

    ALOGD("Touchpad is %d\n", on);
    return (jboolean) ((on == 1) ? true : false);
}

static JNINativeMethod sMethods[] = {
     /* name, signature, funcPtr */
    {"nativeToggleTouchpad", "(Z)Z", (void*)asusec_KeyHandler_nativeToggleTouchpad},
};

int register_asusec_KeyHandler(JNIEnv* env)
{
    return jniRegisterNativeMethods(env, "org/omnirom/asusec/KeyHandler", sMethods, NELEM(sMethods));
}

} /* namespace asusec */
