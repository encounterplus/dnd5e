{% if durationType == nil -%}
{{duration}} {{durationUnit}}
{% elif durationType == 'concentration' -%}
{{durationType|map: 'SpellDuration'}}{% if duration or durationUnit %}, {{'Spell.UpTo'|l}}{% endif %} {{duration}} {{durationUnit}}
{% else -%}
{{durationType|map: 'SpellDuration'}}
{% endif -%}