ARCHS = arm64 arm64e
TARGET = iphone:clang::13.1.3

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FufuPrefs

FufuPrefs_FILES = $(wildcard *.x *.xm *.m *.mm ./ThemeTypes/Battery/*.m ./ThemeTypes/Battery/*.mm ./ThemeTypes/Cellular/*.m)
FufuPrefs_FRAMEWORKS = UIKit
FufuPrefs_PRIVATE_FRAMEWORKS = Preferences
FufuPrefs_INSTALL_PATH = /Library/PreferenceBundles
FufuPrefs_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
FufuPrefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk
