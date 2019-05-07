#!/usr/bin/env bash
set -ex

root_dir="$BITRISE_SOURCE_DIR"

# update DevelopmentTeam
project="DuckDuckGo.xcodeproj/project.pbxproj"
sed -i "" "s/DevelopmentTeam = HKE973VLUW;/DevelopmentTeam = 72SA8V3WYL;/g" "$root_dir/$project"
sed -i "" "s/DEVELOPMENT_TEAM = HKE973VLUW;/DEVELOPMENT_TEAM = 72SA8V3WYL;/g" "$root_dir/$project"

# update Bundle id
sed -i "" "s/PRODUCT_BUNDLE_IDENTIFIER = com.duckduckgo./PRODUCT_BUNDLE_IDENTIFIER = io.bitrise./g" "$root_dir/$project"

# config="Client/Configuration/Fennec.xcconfig"
# sed -i "" "s/MOZ_BUNDLE_ID = org.mozilla.ios.Fennec/MOZ_BUNDLE_ID = io.bitrise.ios.Fennec/g" "$root_dir/$config"

# update profiles
#sed -i "" "s/PROVISIONING_PROFILE_SPECIFIER = \"\";/PROVISIONING_PROFILE_SPECIFIER = \"Bitrise DuckDuckGo Development\";/g" "$root_dir/$project"
#
#sed -i "" "s/PROVISIONING_PROFILE_SPECIFIER = \"\";/PROVISIONING_PROFILE_SPECIFIER = \"Bitrise DuckDuckGo ShareExtension Development\";/g" "$root_dir/$project"
#
#sed -i "" "s/PROVISIONING_PROFILE_SPECIFIER = \"\";/PROVISIONING_PROFILE_SPECIFIER = \"Bitrise DuckDuckGo BookmarksTodayExtension Development\";/g" "$root_dir/$project"
#
#sed -i "" "s/PROVISIONING_PROFILE_SPECIFIER = \"\";/PROVISIONING_PROFILE_SPECIFIER = \"Bitrise DuckDuckGo QuickActionsTodayExtension Development\";/g" "$root_dir/$project"

# update capabilities
duckduckgo_app_entitlements="DuckDuckGo/DuckDuckGo.entitlements"
sed -i "" "s/group.com.duckduckgo/group.io.bitrise/g" "$root_dir/$duckduckgo_app_entitlements"

duckduckgo_app_entitlements=BookmarksTodayExtension/BookmarksTodayExtension.entitlements
sed -i "" "s/group.com.duckduckgo/group.io.bitrise/g" "$root_dir/$duckduckgo_app_entitlements"

duckduckgo_app_entitlements=QuickActionsTodayExtension/QuickActionsTodayExtension.entitlements
sed -i "" "s/group.com.duckduckgo/group.io.bitrise/g" "$root_dir/$duckduckgo_app_entitlements"

#
swift_file=Core/BookmarkUserDefaults.swift
sed -i "" "s/group.com.duckduckgo.bookmark/group.io.bitrise.bookmark/g" "$root_dir/$swift_file"

swift_file=Core/ContentBlockerStoreConstants.swift
sed -i "" "s/group.com.duckduckgo.contentblocker/group.io.bitrise.contentblocker/g" "$root_dir/$swift_file"

swift_file=Core/DDGPersistenceContainer.swift
sed -i "" "s/com.duckduckgo.mobile.ios.Core/io.bitrise.mobile.ios.Core/g" "$root_dir/$swift_file"

swift_file=Core/StatisticsUserDefaults.swift
sed -i "" "s/group.com.duckduckgo.statistics/group.io.bitrise.statistics/g" "$root_dir/$swift_file"

swift_file=DuckDuckGo/AppUserDefaults.swift
sed -i "" "s/group.com.duckduckgo.app/group.io.bitrise.app/g" "$root_dir/$swift_file"
