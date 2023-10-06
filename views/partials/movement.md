{{data.speed.walk|default: 0|units: 'ft'|suffix: ', '}}
{%- if data.speed.burrow %}{{'Movement.Burrow'|l|lowercase}} {{data.speed.burrow|units: 'ft'|suffix: ', '}}{% endif -%}
{% if data.speed.climb %}{{'Movement.Climb'|l|lowercase}} {{data.speed.climb|units: 'ft'|suffix: ', '}}{% endif -%}
{% if data.speed.fly %}{{'Movement.Fly'|l|lowercase}} {{data.speed.fly|units: 'ft'}}{% if data.speed.hover %} (hover), {% else %}, {% endif %}{% endif -%}
{% if data.speed.swim %}{{'Movement.Swim'|l|lowercase}} {{data.speed.swim|units: 'ft'|suffix: ', '}}{% endif -%}{{data.speed.other}}