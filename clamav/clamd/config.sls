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
