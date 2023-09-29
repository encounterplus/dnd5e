{% if durationType == nil -%}
{{duration}} {{durationUnit}}
{% elif durationType == 'concentration' -%}
{{durationType|map: 'SpellDuration'}}{% if duration or durationUnit %}, up to{% endif %} {{duration}} {{durationUnit}}
{% else -%}
{{durationType|map: 'SpellDuration'}}
{% endif -%}