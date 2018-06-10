export PROJECT_FILE_PATH = $(shell pwd)/NSIstanbul/NSIstanbul.xcodeproj
export WORKSPACE_DIR = $(shell pwd)

carthage_update:
	(cd Vendor && carthage update --platform ios --cache-builds)
	rm -Rf Vendor/Carthage/Checkouts

carthage_bootstrap:
	(cd Vendor && carthage bootstrap --platform ios --cache-builds)
	rm -Rf Vendor/Carthage/Checkouts
