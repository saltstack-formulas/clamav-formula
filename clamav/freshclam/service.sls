# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}
{%- set freshclam = clamav.get('freshclam', {}) %}

include:
  - .config

freshclam_daemon:
  service.{{ freshclam.service_state }}:
    - name: {{ freshclam.service_name }}
    - enable: {{ freshclam.service_onboot }}
    - watch:
      - file: freshclam_config
    - require:
      - file: freshclam_config
{% if grains['os_family'] == 'RedHat' %}
      - file: freshclam_service
{% endif %}
      - pkg: freshclam_pkg
