{%- if pillar.mosquitto is defined %}
include:
{%- if pillar.mosquitto.server is defined %}
- mosquitto.server
{%- endif %}
{%- endif %}
