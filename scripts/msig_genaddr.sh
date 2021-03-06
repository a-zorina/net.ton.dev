#!/bin/bash -eE

# Copyright 2020 TON DEV SOLUTIONS LTD.
#
# Licensed under the SOFTWARE EVALUATION License (the "License"); you may not use
# this file except in compliance with the License.  You may obtain a copy of the
# License at:
#
# https://www.ton.dev/licenses
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific TON DEV software governing permissions and limitations
# under the License.
#

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
# shellcheck source=env.sh
. "${SCRIPT_DIR}/env.sh"

"${TON_BUILD_DIR}/utils/tonos-cli" genaddr "${NET_TON_DEV_SRC_TOP_DIR}/configs/MultisigWallet.tvc" \
    "${NET_TON_DEV_SRC_TOP_DIR}/configs/MultisigWallet.abi.json" --genkey "${KEYS_DIR}/msig.keys.json" --wc -1 |
    grep "Raw address" |
    cut -d ' ' -f 3 >"${KEYS_DIR}/${VALIDATOR_NAME}.addr"
