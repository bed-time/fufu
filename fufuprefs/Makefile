TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FufuPrefs

FufuPrefs_FILES = $(wildcard *.x *.xm *.m *.mm)
FufuPrefs_FRAMEWORKS = UIKit
FufuPrefs_PRIVATE_FRAMEWORKS = Preferences
FufuPrefs_INSTALL_PATH = /Library/PreferenceBundles
FufuPrefs_CFLAGS = -fobjc-arc
FufuPrefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk
