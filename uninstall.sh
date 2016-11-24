#!/bin/sh
# RBDSR uninstall

# remove waitmmerging.sh
/usr/bin/rm -f /usr/bin/waitdmmerging.sh

# remove ceph_plugin
/usr/bin/rm -f /etc/xapi.d/plugins/ceph_plugin

# remove RBDSR.py cephutils.py
/usr/bin/rm -f /opt/xensource/sm/RBDSR.*
/usr/bin/rm -f /opt/xensource/sm/RBDSR
/usr/bin/rm -f /opt/xensource/sm/cephutils.*

# delete rbd from xapi.conf
/usr/bin/sed -i '/sm-plugins/s/ rbd / /g' /etc/xapi.conf
/usr/bin/sed -i '/sm-plugins/s/ rbd$//g' /etc/xapi.conf
/usr/bin/sed -i '/sm-plugins/s/=rbd /=/g' /etc/xapi.conf

# end
