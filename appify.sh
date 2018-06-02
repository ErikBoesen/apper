#!/usr/bin/env bash

script_path=$1
app_path=$2
app_name="$(basename $app_path)"

macos_path="$app_path/Contents/MacOS"

mkdir -p "$macos_path"
mv "$script_path" "$macos_path/${app_name%.app}"
