#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo_root=$(CDPATH= cd -- "$script_dir/../.." && pwd)
patch_dir="$script_dir/patch/libmpv"
owned_root=""

if [ "$#" -gt 1 ]; then
    echo "usage: $0 [patched-mpv-source-root]" >&2
    exit 2
fi

if [ "$#" -eq 1 ]; then
    mpv_source=$1
else
    owned_root=$(mktemp -d "${TMPDIR:-/tmp}/mpvkit-ring-test.XXXXXX")
    mpv_source="$owned_root/mpv"
    git clone --quiet --depth 1 --branch v0.41.0 \
        https://github.com/mpv-player/mpv.git "$mpv_source"
    for patch_file in "$patch_dir"/*.patch; do
        git -C "$mpv_source" apply --check "$patch_file"
        git -C "$mpv_source" apply "$patch_file"
    done
fi

cleanup() {
    if [ -n "$owned_root" ]; then
        rm -rf "$owned_root"
    fi
}
trap cleanup EXIT HUP INT TERM

test_source="$mpv_source/test/ao_avfoundation_pcm_ring.c"
test_binary="${TMPDIR:-/tmp}/ao-avfoundation-pcm-ring-test.$$"
trap 'rm -f "$test_binary"; cleanup' EXIT HUP INT TERM

clang -std=c11 -Wall -Wextra -Werror \
    -fsanitize=address,undefined \
    -I "$mpv_source" \
    "$test_source" \
    -o "$test_binary"
"$test_binary"

echo "AVFoundation PCM ring driver-init sizing regression passed"
