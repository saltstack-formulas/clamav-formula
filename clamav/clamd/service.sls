# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}
{%- set clamd = clamav.get('clamd', {}) %}

include:
  - .config

{% if grains['os_family'] == 'FreeBSD' %}
freshclam_initial:
  cmd.run:
    - name: /usr/local/bin/freshclam --quiet
    - require:
      - file: freshclam_config
    - require_in: clamd_daemon
{% endif %}

clamd_daemon:
  service.{{ clamd.service_state }}:
    - name: {{ clamd.service_name }}
    - enable: {{ clamd.service_onboot }}
    - watch:
      - file: clamd_config
    - require:
      - file: clamd_config
      - pkg: clamd_pkg
