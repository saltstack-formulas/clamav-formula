# -*- coding: utf-8 -*-
# vim: ft=sls

{%- from "clamav/map.jinja" import clamav with context %}
{%- set freshclam = clamav.get('freshclam', {}) %}

freshclam_pkg:
  pkg.installed:
    - pkgs:
{%- for pkg in freshclam.pkgs %}
      - {{ pkg }}
{%- endfor %}
