{% if data.ac -%}
**{{'Common.ArmorClass'|l}}:** {{data.ac}}
{% endif -%}
{% if data.range -%}
**{{'Common.Range'|l}}:** {{data.range|units: 'ft'}}
{% endif -%}
{% if data.dmg1 -%}
**{{'Common.Damage'|l}}:** {{data.dmg1}} {{data.dmgType|map: 'Damage'}}
{% endif -%}
{% if data.properties -%}
**{{'Item.Properties'|l}}:** {% for property in data.properties %}{{property|map: 'ItemProperty'}}{%if property == 'versatile' %}{{data.dmg2|brackets|prefix: ' '}}{% endif %}{% if forloop.last != true %}, {% endif %}{% endfor %}
{% endif -%}
{% if data.capacity -%}
**{{'Common.Capacity'|l}}:** {{data.capacity|units: 'lb'}}
{% endif -%}
{% if data.weight -%}
**{{'Common.Weight'|l}}:** {{data.weight|units: 'lb'}}
{% endif -%}
{% if data.value -%}
**{{'Common.Value'|l}}:** {{data.value|units: 'gp'}}
{% endif -%}