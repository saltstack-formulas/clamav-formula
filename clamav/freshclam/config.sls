# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}
{%- set freshclam = clamav.get('freshclam', {}) %}

include:
  - .install

freshclam_config:
  file.managed:
    - name: {{ clamav.config_path}}/{{ freshclam.config_file }}
    - source: salt://clamav/files/freshclam.conf
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: freshclam_pkg
