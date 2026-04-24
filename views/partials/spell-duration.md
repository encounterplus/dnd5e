{% if durationType == nil -%}
{{duration}} {{durationUnit|map: 'SpellDurationUnit'}}
{% elif durationType == 'concentration' -%}
{{durationType|map: 'SpellDuration'}}{% if duration or durationUnit %}, {{'Spell.UpTo'|l}}{% endif %} {{duration}} {{durationUnit|map: 'SpellDurationUnit'}}
{% else -%}
{{durationType|map: 'SpellDuration'}}
{% endif -%}
