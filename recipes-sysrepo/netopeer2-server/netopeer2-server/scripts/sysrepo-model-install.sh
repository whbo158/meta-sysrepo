#!/bin/bash

/usr/bin/sysrepoctl  --install --yang=/usr/share/yang/ietf-netconf-notifications.yang --permissions=666
/usr/bin/sysrepoctl  --install --yang=/usr/share/yang/sysrepo-module-dependencies.yang --permissions=666
/usr/bin/sysrepoctl  --install --yang=/usr/share/yang/sysrepo-notification-store.yang --permissions=666
/usr/bin/sysrepoctl  --install --yang=/usr/share/yang/ietf-netconf-acm@2018-02-14.yang --permissions=666
/usr/bin/sysrepoctl  --install --yang=/usr/share/yang/ietf-netconf@2011-06-01.yang --permissions=666
/usr/bin/sysrepoctl  --install --yang=/usr/share/yang/sysrepo-persistent-data.yang --permissions=666
/usr/bin/sysrepoctl  --install --yang=/usr/share/yang/nc-notifications.yang --permissions=666
/usr/bin/sysrepoctl  --install --yang=/usr/share/yang/notifications.yang --permissions=666


./keystored-model-install.sh
./netopeer2-keystored.sh
./server-model-install.sh
