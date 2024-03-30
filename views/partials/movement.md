{{walk|default: 0|units: 'ft'|suffix: ', '}}
{%- if burrow %}{{'Movement.Burrow'|l|lowercase}} {{burrow|units: 'ft'|suffix: ', '}}{% endif -%}
{% if climb %}{{'Movement.Climb'|l|lowercase}} {{climb|units: 'ft'|suffix: ', '}}{% endif -%}
{% if fly %}{{'Movement.Fly'|l|lowercase}} {{fly|units: 'ft'}}{% if hover %} ({{'Movement.Hover'|l|lowercase}}), {% else %}, {% endif %}{% endif -%}
{% if swim %}{{'Movement.Swim'|l|lowercase}} {{swim|units: 'ft'|suffix: ', '}}{% endif -%}{{other}}