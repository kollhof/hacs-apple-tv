rm -rf ./build
mkdir -p ./build

echo "--- building version ${RELEASE_VERSION} ---"

# copy sources
cp -r ./home-assistant-core/homeassistant/components/apple_tv \
  ./build/

cp README.md ./build/apple_tv/
cp hacs.json ./build/apple_tv/


# add version entry if not present
jq '. + {version: "0.0.1"} + {name: "Apple TV - DEV"}' \
  ./home-assistant-core/homeassistant/components/apple_tv/manifest.json \
  > ./build/apple_tv/manifest.json

(cd build/apple_tv && zip -r ../hacs.zip .)

