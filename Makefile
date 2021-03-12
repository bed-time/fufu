export ARCHS = arm64 arm64e
export TARGET = iphone:clang::13.1.3
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Fufu

Fufu_FILES = $(wildcard *.x *.xm *.m *.mm)
Fufu_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

FufuPrefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

SUBPROJECTS += fufuprefs
include $(THEOS_MAKE_PATH)/aggregate.mk


after-install::
		install.exec "killall -9 SpringBoard"
