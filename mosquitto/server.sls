{%- from "mosquitto/map.jinja" import server with context %}
{%- if server.enabled %}

mosquitto_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

/etc/mosquitto/mosquitto.conf:
  file.managed:
  - source: salt://mosquitto/files/mosquitto.conf
  - template: jinja
  - user: root
  - group: root
  - mode: 644
  - require:
    - pkg: mosquitto_packages

mosquitto_service:
  service.running:
  - enable: true
  - name: {{ server.service }}
  - watch:
    - file: /etc/mosquitto/mosquitto.conf

{%- endif %}