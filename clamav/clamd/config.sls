# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}
{%- set clamd = clamav.get('clamd', {}) %}

include:
  - .install

clamd_config:
  file.managed:
    - name: {{ clamd.config_path}}/{{ clamd.config_file }}
    - source: salt://clamav/files/clamd.conf
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: clamd_pkg

{% if grains['os_family'] == 'RedHat' %}
  {% if salt['grains.get']('selinux:enforced', False) == 'Enforcing' %}
antivirus_can_scan_system:
  selinux.boolean:
    - value: True
    - persist: True

clamd_use_jit:
  selinux.boolean:
    - value: True
    - persist: True
  {% endif %}
{% endif %}

