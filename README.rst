================
clamav-formula
================

SaltStack Formula to set up and configure ClamAV, an antivirus engine designed
for detecting Trojans, viruses, malware and other malicious threats

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``clamav``
------------

Installs clamav and freshclam package, and starts the associated services.

``clamav.clamd``
----------------

Installs clamav package, and starts the associated services.

``clamav.freshclam``
----------------

Installs freshclam package, and starts the associated services.
