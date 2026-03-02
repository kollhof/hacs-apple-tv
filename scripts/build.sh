rm -rf ./build
mkdir -p ./build/custom_components

# copy sources
cp -r ./home-assistant-core/homeassistant/components/apple_tv \
  ./build/custom_components/

# add version entry if not present
jq '. + {version: "0.0.1-dev"} + .' \
  ./home-assistant-core/homeassistant/components/apple_tv/manifest.json \
  > ./build/custom_components/apple_tv/manifest.json

(cd build && zip -r ./hacs.zip ./custom_components)

