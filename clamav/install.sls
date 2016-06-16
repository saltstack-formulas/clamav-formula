# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "clamav/map.jinja" import clamav with context %}

clamav-pkg:
  pkg.installed:
    - pkgs: {{ clamav.pkgs }}
