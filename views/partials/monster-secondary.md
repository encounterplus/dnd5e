{% if data.savingThrows -%}
**Saving Throws** {% for key, value in data.savingThrows %}{{key|capitalize}} [{{value|signed}}](/roll/d20{{value|signed}}/{{key|map: 'Ability'}}/save), {% endfor %}
{% endif -%}
{% if data.skills -%}
**Skills** {% for key, value in data.skills %}{{key|map: 'Skill'}} [{{value|signed}}](/roll/d20{{value|signed}}/{{key|map: 'Skill'}}/check), {% endfor %}
{% endif -%}
{% if data.damageVulnerabilities -%}
**Damage Vulnerabilities** {{data.damageVulnerabilities|map: 'Damage'|lowercase}}
{% endif -%}
{% if data.damageResistances -%}
**Damage Resistances** {{data.damageResistances|map: 'Damage'|lowercase}}
{% endif -%}
{% if data.damageImmunities -%}
**Damage Immunities** {{data.damageImmunities|map: 'Damage'|lowercase}}
{% endif -%}
{% if data.conditionImmunities -%}
**Condition Immunities** {% for condition in data.conditionImmunities %}[{{condition|lowercase}}](condition), {% endfor %}
{% endif -%}
**Senses** {% include "senses.md" %}{% if data.passivePerception %}{{"Sense.PassivePerception"|l}} {{data.passivePerception}}{% endif %} 
{% if data.languages -%}
**Languages** {{data.languages|map: 'Language'}}
{% endif -%}
**Challenge** {{data.cr}} ({{data.cr|map:'ChallengeRatingToXP', '0'}} XP)
**Proficiency Bonus** [{{data.proficiencyBonus|signed}}](roll "Proficiency")