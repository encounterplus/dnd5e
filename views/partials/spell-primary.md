{% if data.activation.time and data.activation.unit -%}
**{{'Spell.CastingTime'|l}}:** {% include 'activation.md' data %}{% if data.ritual %}• {{'Spell.Ritual'|l}}{% endif %}
{% endif -%}
{% if data.range or data.rangeType -%}
**{{'Spell.Range'|l}}:** {% include 'spell-range.md' data %} {% if data.areaEffectSize %}({{data.areaEffectSize|units: 'ft'}} ![shape](/icons/aoe/{{data.areaEffectShape}}.png#height=18)){% endif %}
{% endif -%}
{% if data.components -%}
**{{'Spell.Components'|l}}:** {{data.components|join: ', '}} {{data.componentsDetail|brackets}}
{% endif -%}
{% if data.duration or data.durationType -%}
**{{'Spell.Duration'|l}}:** {% include 'spell-duration.md' data %}
{% endif -%}