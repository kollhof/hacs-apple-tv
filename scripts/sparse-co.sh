cd home-assistant-core
git sparse-checkout init --no-cone
git sparse-checkout set --no-cone homeassistant/components/apple_tv
cd ..

rm -rf home-assistant-core
git submodule update --init --recursive