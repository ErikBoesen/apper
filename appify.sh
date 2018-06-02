#!/usr/bin/env bash

RED="\e[31m"
CYAN="\e[36m"
YELLOW="\e[33m"
GREEN="\e[32m"
RESET="\e[0m"

function log { printf "\- $1.\n"; }
function succ { printf "${GREEN}$1${RESET}\n"; }
function warn { printf "${YELLOW}$1${RESET}\n"; }
function fail {
    printf "${RED}$1${RESET}\n" >&2
    exit 1
}

if [[ $# -lt 2 ]]; then
    fail "Not enough arguments!"
fi

exec_path=$1
app_path=$2
app_name="$(basename $app_path)"
app_shortname="${app_name%.app}"
log "Assembling $app_name"

shift
shift

while [[ $# -gt 0 ]]; do
key="$1"

case $key in
    -i|--icon)
    icon_path="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    warn "Unknown argument $1!"
    ;;
esac
done

contents_path="$app_path/Contents"
info_path="$contents_path/Info.plist"
macos_path="$contents_path/MacOS"
resources_path="$contents_path/Resources"

log "Creating Info.plist at $info_path"
mkdir -p "$contents_path"
cat > "$info_path" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleExecutable</key>
	<string>$app_shortname</string>
	<key>CFBundleIconFile</key>
	<string>$app_shortname.icns</string>
</dict>
</plist>
EOF

log "Copying executable $exec_path to $macos_path/$app_shortname"
mkdir -p "$macos_path"
cp "$exec_path" "$macos_path/$app_shortname"
chmod +x "$macos_path/$app_shortname"
if [[ ! -z "$icon_path" ]]; then
    log "Copying icon $icon_path to $resources_path"
    mkdir -p "$resources_path"
    cp "$icon_path" "$resources_path/$app_shortname.icns"
fi
