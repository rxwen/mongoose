# Copyright (C) 2008 The Android Open Source Project
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
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := eng
LOCAL_C_INCLUDES := $(LOCAL_PATH) \
	external/mbedtls/include

LOCAL_CFLAGS += -DMG_ENABLE_SSL \
				-DMG_SSL_IF=MG_SSL_IF_MBEDTLS \
				-DMG_SSL_MBED_DUMMY_RANDOM

LOCAL_SRC_FILES := \
	mongoose.c

#LOCAL_LDLIBS += -ldl
LOCAL_SHARED_LIBRARIES := libmbedtls

ifneq ($(TARGET_SIMULATOR),true)
#LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_MODULE := libmongoose
include $(BUILD_SHARED_LIBRARY)
