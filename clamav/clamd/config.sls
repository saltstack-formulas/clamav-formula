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
    - user: {{ clamd.config_file_owner }}
    - group: {{ clamd.config_file_group }}
    - require:
      - pkg: clamd_pkg

{% if grains['os_family'] == 'RedHat' %}
  {% if salt['grains.get']('selinux:enforced') == 'Enforcing' %}
policycoreutils-python:
  pkg.installed:
    - name: policycoreutils-python

antivirus_can_scan_system:
  selinux.boolean:
    - name: antivirus_can_scan_system
    - value: True
    - persist: True
    - require:
      - pkg: clamd_pkg

antivirus_use_jit:
  selinux.boolean:
    - name: antivirus_use_jit
    - value: True
    - persist: True
    - require:
      - pkg: clamd_pkg
  {% endif %}
{% endif %}

