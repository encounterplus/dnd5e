{% if data.skills -%}
**{{'Monster.Skills'|l}}** {% for key, value in data.skills %}{{key|map: 'Skill'}} [{{value|signed}}](</roll/d20{{value|signed}}/{{key|map: 'Skill'}}/check>), {% endfor %}
{% endif -%}
{% if data.gear -%}
**{{'Monster.Gear'|l}}** {{data.gear}}
{% endif -%}
{% if data.damageVulnerabilities -%}
**{{'Monster.Vulnerabilities'|l}}** {{data.damageVulnerabilities|map: 'Damage'}}
{% endif -%}
{% if data.damageResistances -%}
**{{'Monster.Resistances'|l}}** {{data.damageResistances|map: 'Damage'}}
{% endif -%}
{% if data.damageImmunities or data.conditionImmunities -%}
**{{'Monster.Immunities'|l}}** {{data.damageImmunities|map: 'Damage'|suffix: '; '}}{{data.conditionImmunities|link: 'condition'|join: ', '}}
{% endif -%}
**{{'Monster.Senses'|l}}** {% include "senses.md" data.senses %}{% if data.passivePerception %}{{"Sense.PassivePerception"|l}} {{data.passivePerception}}{% endif %} 
{% if data.languages -%}
**{{'Monster.Languages'|l}}** {{data.languages|map: 'Language'}}
{% endif -%}
**{{'Common.CR'|l}}** {{data.cr}} ({{'Common.XP'|l}} {{data.cr|map:'ChallengeRatingToXP', '0'}}; {{'Common.PB'|l}} [{{data.proficiencyBonus|signed}}](roll "Proficiency"))