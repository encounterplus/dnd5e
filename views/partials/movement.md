{{data.speed.walk|format|suffix: ' ft., '|default: '0 ft., '}}
{%- if data.speed.burrow %}{{'Movement.Burrow'|l|lowercase}} {{data.speed.burrow|format|suffix: ' ft., '}}{% endif -%}
{% if data.speed.climb %}{{'Movement.Climb'|l|lowercase}} {{data.speed.climb|format|suffix: ' ft., '}}{% endif -%}
{% if data.speed.fly %}{{'Movement.Fly'|l|lowercase}} {{data.speed.fly|format|suffix: ' ft.'}}{% if data.speed.hover %} (hover), {% else %}, {% endif %}{% endif -%}
{% if data.speed.swim %}{{'Movement.Swim'|l|lowercase}} {{data.speed.swim|format|suffix: ' ft., '}}{% endif -%}{{data.speed.other}}