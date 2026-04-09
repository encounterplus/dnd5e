{% if blindsight %}{{'Sense.Blindsight'|l}} {{blindsight|units: 'ft'}}, {% endif -%}
{% if darkvision %}{{'Sense.Darkvision'|l}} {{darkvision|units: 'ft'}}, {% endif -%}
{% if tremorsense %}{{'Sense.Tremorsense'|l}} {{tremorsense|units: 'ft'}}, {% endif -%}
{% if truesight %}{{'Sense.Truesight'|l}} {{truesight|units: 'ft'}}, {% endif -%}{{other|suffix: ', '}}