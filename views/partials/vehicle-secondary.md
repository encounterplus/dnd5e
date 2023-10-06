{% if data.damageVulnerabilities -%}
**{{'Monster.DamageVulnerabilities'|l}}** {{data.damageVulnerabilities|map: 'Damage'|lowercase}}
{% endif -%}
{% if data.damageResistances -%}
**{{'Monster.DamageResistances'|l}}** {{data.damageResistances|map: 'Damage'|lowercase}}
{% endif -%}
{% if data.damageImmunities -%}
**{{'Monster.DamageImmunities'|l}}** {{data.damageImmunities|map: 'Damage'|lowercase}}
{% endif -%}
{% if data.conditionImmunities -%}
**{{'Monster.ConditionImmunities'|l}}** {% for condition in data.conditionImmunities %}[{{condition|lowercase}}](condition), {% endfor %}
{% endif -%}