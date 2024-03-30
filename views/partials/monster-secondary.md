{% if data.savingThrows -%}
**{{'Monster.SavingThrows'|l}}** {% for key, value in data.savingThrows %}{{key|map: 'AbilityAbbr'|lowercase|capitalize}} [{{value|signed}}](/roll/d20{{value|signed}}/{{key|map: 'Ability'}}/save), {% endfor %}
{% endif -%}
{% if data.skills -%}
**{{'Monster.Skills'|l}}** {% for key, value in data.skills %}{{key|map: 'Skill'}} [{{value|signed}}](/roll/d20{{value|signed}}/{{key|map: 'Skill'}}/check), {% endfor %}
{% endif -%}
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
**{{'Monster.Senses'|l}}** {% include "senses.md" data.senses %}{% if data.passivePerception %}{{"Sense.PassivePerception"|l}} {{data.passivePerception}}{% endif %} 
{% if data.languages -%}
**{{'Monster.Languages'|l}}** {{data.languages|map: 'Language'}}
{% endif -%}
**{{'Monster.Challenge'|l}}** {{data.cr}} ({{data.cr|map:'ChallengeRatingToXP', '0'}} XP)
**{{'Monster.ProficiencyBonus'|l}}** [{{data.proficiencyBonus|signed}}](roll "Proficiency")