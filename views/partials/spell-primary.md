{% if data.activation.time and data.activation.unit -%}
**Casting Time:** {% include 'activation.md' data %}{% if data.ritual %}• Ritual{% endif %}
{% endif -%}
{% if data.range or data.rangeType -%}
**Range:** {% include 'spell-range.md' data %} {% if data.areaEffectSize %}({{data.areaEffectSize|format}} ft ![shape](/icons/aoe/{{data.areaEffectShape}}.png#height=18)){% endif %}
{% endif -%}
{% if data.components -%}
**Components:** {{data.components|join: ', '}} {{data.componentsDetail|brackets}}
{% endif -%}
{% if data.duration or data.durationType -%}
**Duration:** {% include 'spell-duration.md' data %}
{% endif -%}