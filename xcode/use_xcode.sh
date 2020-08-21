#!/bin/sh

# Name your Xcode versions as `Xcode_<xcode_version>.app`
# e.g. - `Xcode_11-4-1`, `Xcode_11-3-1`

# This will symlink `/Applications/Xcode.app` to your selected version

# Modifies the DEVELOPER_DIR environment variable to select the correct Xcode
# Inspiration comes from: https://macops.ca/developer-binaries-on-os-x-xcode-select-and-xcrun/
#
# sourcing this script is needed over executing: https://superuser.com/questions/176783/what-is-the-difference-between-executing-a-bash-script-vs-sourcing-it

# https://gist.github.com/JohnSundell/620c3d12aca69fbe259f69391cc532f8
# if [ "$EUID" -ne 0 ]; then
#     echo "xcode-select requires you to run this script as root; 'sudo xcode-switch'"
#     exit
# fi

declare -a available_versions=($(ls -1d /Applications/Xcode*.app))

function usage() {
    echo "Usage: source use_xcode.sh <xcode_version>"
    echo ""
    echo "Available Versions: (Xcode_<xcode_version>.app)"
    echo ""
    for version in "${available_versions[@]}"
    do
        echo "$version"
    done
}

function set_version() {
    xcode_link="/Applications/Xcode.app"
    found_version=""
    match_version="/Applications/Xcode_$1.app"

    for version in "${available_versions[@]}"
    do
        if [ "$version" = "$match_version" ]; then
            found_version=$version
            break
        fi
    done

    if [[ -n "$found_version" ]]; then
        developer_path="$found_version/Contents/Developer"
        echo "Seting Xcode version to: $found_version ($developer_path)"

        # This ENV takes precedence when set
        export DEVELOPER_DIR=$developer_path

        # Switch default version to Xcode.app
        sudo xcode-select -switch /Applications/Xcode.app

        # smylink the default path (remove the link if it exists first)
        if [ -e $xcode_link ]; then
            echo "Unlink default xcode path: $xcode_link"
            unlink "$xcode_link"
        fi

        # ls -la /Applications/Xcode*
        echo "Linking used xcode to default path ($found_version to $xcode_link)"
        ln -s "$found_version" "$xcode_link"

        # Verify path
        echo "DEVELOPER_DIR : $DEVELOPER_DIR"
        echo "xcode-select  : $(xcode-select -p)"
        echo "xcodebuild    :"
        xcodebuild -version
        echo ""
        echo "xcode SDKs    :"
        xcodebuild -showsdks
    else
        echo "Xcode version $1 not found"
        usage
        false
    fi
}

# Check for input
if [[ -n "$1" ]]; then
    set_version "${1/./.}"
    true
else
    echo "Current:"
    echo "$(xcodebuild -version)"
    echo "**************************"
    echo ""
    usage
    false
fi