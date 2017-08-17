# Explanation: https://github.com/opengapps/aosp_build
 
# Base package
GAPPS_VARIANT := mini
 
# Extra desired packages
PRODUCT_PACKAGES += \
	Chrome \
	Drive \
	LatinImeGoogle \
	Music2 \
        PrebuiltGmail \

# Excluded packages
GAPPS_EXCLUDED_PACKAGES += \
    GooglePackageInstaller \
    GoogleCamera \
    PrebuiltBugle \
    PrebuiltKeep \
    GoogleNFCTags \
    GoogleDeskClock \
    GoogleCalculator \
    GoogleHome

# Chrome and Messanging overrides
GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_FORCE_MMS_OVERRIDES := true

# Don't remove Gallery because of Photos
GAPPS_BYPASS_PACKAGE_OVERRIDES := Photos
