#!/usr/bin/env bash

script_path=$1
app_path=$2
app_name="$(basename $app_path)"

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

macos_path="$app_path/Contents/MacOS"
resources_path="$app_path/Contents/Resources"

mkdir -p "$macos_path"
mv "$script_path" "$macos_path/${app_name%.app}"
if [[ ! -z "$icon_path" ]]; then
    mkdir -p "$resources_path"
    cp "$icon_path" "$resources_path/${app_name%.app}.icns"
fi
