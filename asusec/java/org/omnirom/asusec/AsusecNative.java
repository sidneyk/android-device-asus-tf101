/*
 * Copyright (C) 2012 The CyanogenMod Project
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

package org.omnirom.asusec;

import android.util.Log;

public final class AsusecNative {

    private static final String TAG = "AsusecNative";

    private static final boolean DEBUG = false;

    private static boolean sLoaded = false;

    public static synchronized void loadAsusecLib() {
        if (!sLoaded) {
            System.loadLibrary("asusec_jni");
            sLoaded = true;
            if (DEBUG) {
                Log.i(TAG, "Asusec native library loaded");
            }
        }
    }

}
