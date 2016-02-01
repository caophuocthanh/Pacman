export TARGET := iphone:8.1:6.0
export TARGET_IPHONEOS_DEPLOYMENT_VERSION = 6.0
export ARCHS = armv7 armv7s arm64
include theos/makefiles/common.mk

TWEAK_NAME = pacman
pacman_FILES = Tweak.xm Game.m Pacman.m Noname.m
pacman_FRAMEWORKS = UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/var$(ECHO_END)
	$(ECHO_NOTHING)cp -R pacman $(THEOS_STAGING_DIR)/var$(ECHO_END)
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -name .DS_Store | xargs rm -rf$(ECHO_END)

after-install::
	install.exec "killall -9 SpringBoard"
