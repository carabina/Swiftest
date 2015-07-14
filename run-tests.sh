root_dir=$(pwd)
core_dir="$root_dir/build/SwiftestCore"
client_dir="$root_dir/build/SwiftestClient"
includes="-L$core_dir -I$core_dir -L$client_dir -I$client_dir"
dyld_path="$core_dir:$client_dir"

files=$(find ./src/Example -type f -name "*[Ss]pec.swift")
tempfile="/tmp/swiftest-specs-$(date +%s).swift"

cat $files > $tempfile
echo "SwiftestClient.run()" >> $tempfile

# DYLD_LIBRARY_PATH="$dyld_path" xcrun --sdk macosx swiftc $includes \
#   -lSwiftestCore -lSwiftestClient $tempfile -o build/tests
#
# DYLD_LIBRARY_PATH=$dyld_path build/tests

DYLD_LIBRARY_PATH="$dyld_path" xcrun --sdk macosx swift $includes \
  -lSwiftestCore -lSwiftestClient $tempfile

rm $tempfile
