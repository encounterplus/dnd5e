## Skill: {{self.skill|map: 'Skill'}}
{% set bonusKey %}data.skills.{{self.skill}}.bonus{% endset %}

### Bonus Breakdown

**Ability Modifier** {{ data.abilities[self.ability].modifier|signed }}
{% if self.otherBonus -%}
**Other Bonus** {{ self.otherBonus|signed}}
{% endif -%}
**Proficiency Bonus** {% filter signed %}{% eval %}0 {% if self.proficiency == 'proficient' %} + {{data.proficiencyBonus}} {% endif %} {% if self.proficiency == 'half' %} + floor({{data.proficiencyBonus}} / 2) {% endif %} {% if self.proficiency == 'expertise' %} + ({{data.proficiencyBonus}} * 2) {% endif %}{% endeval %}{% endfilter %}
{% for modifier in data.modifiers -%}
{% if modifier.attribute == bonusKey -%}
**{{ modifier.name }}** {{modifier|modifier}}
{% endif -%}
{% endfor %}
**Total Bonus** {{ self.bonus|signed }}


