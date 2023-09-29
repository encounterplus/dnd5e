{% if data.senses.blindsight %}{{'Sense.Blindsight'|l|lowercase}} {{data.senses.blindsight|format|suffix: ' ft., '}}{% endif -%}
{% if data.senses.darkvision %}{{'Sense.Darkvision'|l|lowercase}} {{data.senses.darkvision|format|suffix: ' ft., '}}{% endif -%}
{% if data.senses.tremorsense %}{{'Sense.Tremorsense'|l|lowercase}} {{data.senses.tremorsense|format|suffix: ' ft., '}}{% endif -%}
{% if data.senses.truesight %}{{'Sense.Truesight'|l|lowercase}} {{data.senses.truesight|format|suffix: ' ft., '}}{% endif -%}{{data.senses.other|suffix: ', '}}