Ceph salt states
================

Load into `/srv/salt/ceph`.

Configuration
--------------

First, setup some pillar data for your storage configuration.

    ceph:
        devices:
            node-0025904fc1de:
                0: sdb
                1: sdc
            node-0025904fc34c:
                2: sdb
                3: sdc
        monitors:
            - node-0025904fc1de
            - node-0025904fc34c

Then run `state.sls` `ceph` on all participating nodes in order to
deploy the configuration.  To make the cluster, you will then run:

    mkcephfs -a -c /etc/ceph/ceph.conf --mkfs

That's it!
