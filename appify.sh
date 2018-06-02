#!/usr/bin/env bash

exec_path=$1
app_path=$2
app_name="$(basename $app_path)"
app_shortname="${app_name%.app}"

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
    echo "Unknown argument $1."
    ;;
esac
done

contents_path="$app_path/Contents"
info_path="$contents_path/Info.plist"
macos_path="$contents_path/MacOS"
resources_path="$contents_path/Resources"

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

mkdir -p "$macos_path"
cp "$exec_path" "$macos_path/$app_shortname"
chmod +x "$macos_path/$app_shortname"
if [[ ! -z "$icon_path" ]]; then
    mkdir -p "$resources_path"
    cp "$icon_path" "$resources_path/$app_shortname.icns"
fi
