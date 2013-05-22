{% import "openstack/config.sls" as config with context %}
{% set ip = config.internal_ip %}
{% if not ip %}
{% set ip = salt['network.ip_addrs']()[0] %}
{% endif %}

{% set ceph = pillar.get('ceph', {}) %}
{% set fsid = ceph.get('fsid', '') %}
{% set source = ceph.get('source', 'deb http://ceph.com/debian precise main') %}
{% set devices = ceph.get('devices', {}) %}
{% set monitors = ceph.get('monitors', []) %}
{% set metadata = ceph.get('metadata', []) %}
{% set auth = ceph.get('auth', {}) %}
