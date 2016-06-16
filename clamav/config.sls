# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "clamav/map.jinja" import clamav with context %}

include:
  - clamav.install

clamav_daemon_config:
  file.managed:
    - name: {{ clamav.daemon.config }}
    - source: salt://clamav/files/clamd.conf
    - mode: 644
    - user: root
    - group: root
    - watch_in:
      - service: clamav_daemon
    - require:
      - pkg: clamav-pkg

freshclam_config:
  file.managed:
    - name: {{ clamav.freshclam.config }}
    - source: salt://clamav/files/freshclam.conf
    - mode: 644
    - user: {{ clamav.user }}
    - group: adm
    - watch_in:
      - service: clamav_freshclam
    - require:
      - pkg: clamav-pkg
