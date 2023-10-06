{% if data.senses.blindsight %}{{'Sense.Blindsight'|l|lowercase}} {{data.senses.blindsight|units: 'ft'|suffix: ', '}}{% endif -%}
{% if data.senses.darkvision %}{{'Sense.Darkvision'|l|lowercase}} {{data.senses.darkvision|units: 'ft'|suffix: ', '}}{% endif -%}
{% if data.senses.tremorsense %}{{'Sense.Tremorsense'|l|lowercase}} {{data.senses.tremorsense|units: 'ft'|suffix: ', '}}{% endif -%}
{% if data.senses.truesight %}{{'Sense.Truesight'|l|lowercase}} {{data.senses.truesight|units: 'ft'|suffix: ', '}}{% endif -%}{{data.senses.other|suffix: ', '}}