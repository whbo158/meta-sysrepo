#!/bin/bash

set -eu -o pipefail

shopt -s failglob

local_path=$(dirname $0)

: ${SYSREPOCTL:=/usr/bin/sysrepoctl}
: ${SYSREPOCTL_ROOT_PERMS:=-o root:root -p 666}
: ${YANG_DIR:=/etc/Netopeer2/modules}

is_yang_module_installed() {
    module=$1

    $SYSREPOCTL -l | grep -c "^$module [^|]*|[^|]*| Installed .*$" > /dev/null
}

install_yang_module() {
    module=$1

    if ! is_yang_module_installed $module; then
        echo "- Installing module $module..."
        $SYSREPOCTL -i -g ${YANG_DIR}/$module.yang $SYSREPOCTL_ROOT_PERMS
    else
        echo "- Module $module already installed."
    fi
}

install_yang_module ietf-x509-cert-to-name
install_yang_module ietf-keystore
