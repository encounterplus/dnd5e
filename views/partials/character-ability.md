## Ability: {{self.ability|map: 'Ability'}}

{% set valueKey %}data.abilities.{{self.ability}}.value{% endset %}
{% set savingThrowKey %}data.abilities.{{self.ability}}.savingThrow.bonus{% endset %}

### Score Breakdown

**Base Score** {{self.base|default: 8}}
{% if self.otherBonus -%}
**Other Bonus** {{self.otherBonus|signed}}
{% endif -%}
{% for modifier in data.modifiers -%}
{% if modifier.attribute == valueKey -%}
**{{ modifier.name }}** {{modifier|modifier}}
{% endif -%}
{% endfor %}
**Total Score** {{self.value}}
**Modifier** {{ self.modifier|signed }}

### Saving Throw Breakdown

**Ability Modifier** {{ self.modifier|signed }}
{% if self.savingThrow.otherBonus -%}
**Other Bonus** {{ self.savingThrow.otherBonus|signed}}
{% endif -%}
**Proficiency Bonus** {% filter signed %}{% eval %}0 {% if self.savingThrow.proficiency == 'proficient' %} + {{data.proficiencyBonus}} {% endif %} {% if self.savingThrow.proficiency == 'half' %} + floor({{data.proficiencyBonus}} / 2) {% endif %} {% if self.savingThrow.proficiency == 'expertise' %} + ({{data.proficiencyBonus}} * 2) {% endif %}{% endeval %}{% endfilter %}
{% for modifier in data.modifiers -%}
{% if modifier.attribute == savingThrowKey -%}
**{{ modifier.name }}** {{modifier|modifier}}
{% endif -%}
{% endfor %}
**Total Bonus** {{ self.savingThrow.bonus|signed }}

