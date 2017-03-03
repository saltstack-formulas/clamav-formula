# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}
{%- set clamd = clamav.get('clamd', {}) %}

include:
  - .config

clamd_daemon:
  service.{{ clamd.service_state }}:
    - name: {{ clamd.service_name }}
    - enable: {{ clamd.service_onboot }}
    - watch:
      - file: clamd_config
    - require:  
      - file: clamd_config
      - pkg: clamd_pkg
