#!/bin/sh
# RBDSR install

# copy waitdmmerging.sh
/usr/bin/cp ./waitdmmerging.sh /usr/bin/

# copy ceph_plugin.py
/usr/bin/cp ./ceph_plugin.py /etc/xapi.d/plugins/ceph_plugin

# copy RBDSR.py cephutils.py
/usr/bin/cp ./cephutils.py /opt/xensource/sm/
/usr/bin/cp ./RBDSR.py /opt/xensource/sm/

# compile python
/usr/bin/python -m compileall /opt/xensource/sm/RBDSR.py
/usr/bin/python -O -m compileall /opt/xensource/sm/RBDSR.py
/usr/bin/python -m compileall /opt/xensource/sm/cephutils.py
/usr/bin/python -O -m compileall /opt/xensource/sm/cephutils.py
ln -s /opt/xensource/sm/RBDSR.py /opt/xensource/sm/RBDSR

# insert rbd to xapi.conf
check_1=`sed -n '/sm-plugins/p' /etc/xapi.conf | sed -n '/=rbd /p'`
check_2=$(sed -n '/sm-plugins/p' /etc/xapi.conf | sed -n '/ rbd$/p')
check_3=$(sed -n '/sm-plugins/p' /etc/xapi.conf | sed -n '/ rbd /p')

if [ "$check_1" ]; then
    echo "rbd exist."
elif [ "$check_2" ]; then
    echo "rbd exist."
elif [ "$check_3" ]; then
    echo "rbd exist."
else
    sed -i '/sm-plugins/s/=/=rbd\ /g' /etc/xapi.conf
fi

# end
