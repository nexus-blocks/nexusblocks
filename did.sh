#!/usr/bin/env bash


function generate_did() {
  local canister=$1
  canister_root="backend/$canister"

  cargo build --manifest-path="$canister_root/Cargo.toml" \
      --target wasm32-unknown-unknown \
      --release --package "$canister" \

  candid-extractor "target/wasm32-unknown-unknown/release/$canister.wasm" > "$canister_root/$canister.did"
}

CANISTERS=main,platform,platform_manager,user,user_manager

for canister in $(echo $CANISTERS | sed "s/,/ /g")
do
    generate_did "$canister"
done