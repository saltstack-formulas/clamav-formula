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

{% if grains['os_family'] == 'RedHat' %}
freshclam_service
  file.managed:
    - name: /etc/systemd/systemd/{{ freshclam.service_name }}
    - source: salt://clamav/files/{{ freshclam.service_name }}
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: freshclam_pkg
{% endif %}
