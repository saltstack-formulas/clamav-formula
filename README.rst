================
clamav-formula
================

SaltStack Formula to set up and configure ClamAV, an antivirus engine designed
for detecting Trojans, viruses, malware and other malicious threats

On 'Redhat' based systems epel-formula should also be used

To execute tests on 'FreeBSD' you need vagrant.
  - Use `bundle install --with freebsd` before running kitchen.
  - Execute `env KITCHEN_LOCAL_YAML=.kitchen.freebsd.yml kitchen test`

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

.. image:: https://travis-ci.org/saltstack-formulas/clamav-formula.svg?branch=master


Available states
================

.. contents::
    :local:

``clamav``
----------

Meta-state that includes ``clamav.freshclam`` and ``clamav.clamd`` state.


``clamav.clamd``
----------------

Meta-state to install clamd, config file and service.

``clamav.clamd.install``
------------------------

Installs clamav package.

``clamav.clamd.config``
-----------------------

Manages the clamd.conf file for clamd.

``clamav.clamd.service``
------------------------

Manages the clamd daemon service.

``clamav.freshclam``
--------------------

Meta-state to Install freshclam, config file and service.

``clamav.freshclam.install``
----------------------------

Installs freshclam package.

``clamav.freshclam.config``
---------------------------

Manages the freshclam.conf file for freshclam.

``clamav.freshclam.service``
----------------------------

Manages the freshclam daemon service.

