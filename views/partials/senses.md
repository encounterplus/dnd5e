{% if blindsight %}{{'Sense.Blindsight'|l|lowercase}} {{blindsight|units: 'ft'|suffix: ', '}}{% endif -%}
{% if darkvision %}{{'Sense.Darkvision'|l|lowercase}} {{darkvision|units: 'ft'|suffix: ', '}}{% endif -%}
{% if tremorsense %}{{'Sense.Tremorsense'|l|lowercase}} {{tremorsense|units: 'ft'|suffix: ', '}}{% endif -%}
{% if truesight %}{{'Sense.Truesight'|l|lowercase}} {{truesight|units: 'ft'|suffix: ', '}}{% endif -%}{{other|suffix: ', '}}