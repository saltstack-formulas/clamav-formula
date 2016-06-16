# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "clamav/map.jinja" import clamav with context %}

include:
  - clamav.install

clamav_daemon:
  service.running:
    - name: {{ clamav.daemon.name }}
    - enable: True
    - require:  
      - pkg: clamav-pkg

clamav_freshclam:
  service.running:
    - name: {{ clamav.freshclam.name }}
    - enable: True
    - require:
      - pkg: clamav-pkg
