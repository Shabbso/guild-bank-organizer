#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
project_dir=$(CDPATH= cd -- "$script_dir/.." && pwd)
toc_file="$project_dir/GuildBankOrganizer/GuildBankOrganizer.toc"
license_file="$project_dir/LICENSE"

if [ ! -f "$license_file" ]; then
    echo "LICENSE is required before building a public release." >&2
    exit 1
fi

version=$(awk -F ': ' '/^## Version:/ { print $2; exit }' "$toc_file")
if [ -z "$version" ]; then
    echo "Could not read the addon version from the TOC." >&2
    exit 1
fi

stage_dir=$(mktemp -d "${TMPDIR:-/tmp}/gbo-package.XXXXXX")
trap 'rm -rf "$stage_dir"' EXIT HUP INT TERM

cp -R "$project_dir/GuildBankOrganizer" "$stage_dir/GuildBankOrganizer"
cp "$project_dir/README.md" "$stage_dir/GuildBankOrganizer/README.md"
cp "$project_dir/CHANGELOG.md" "$stage_dir/GuildBankOrganizer/CHANGELOG.md"
cp "$project_dir/ACKNOWLEDGMENTS.md" "$stage_dir/GuildBankOrganizer/ACKNOWLEDGMENTS.md"
cp "$license_file" "$stage_dir/GuildBankOrganizer/LICENSE"
find "$stage_dir/GuildBankOrganizer" -name '.DS_Store' -delete

archive="$project_dir/dist/GuildBankOrganizer-$version.zip"
mkdir -p "$project_dir/dist"
(
    cd "$stage_dir"
    zip -qr "$stage_dir/release.zip" GuildBankOrganizer
)
mv "$stage_dir/release.zip" "$archive"
unzip -tq "$archive"

echo "$archive"
