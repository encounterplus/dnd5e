## Armor Class

{% if activeArmor -%}
**{{activeArmor.name}}** {{activeArmor.definition.data.ac|default: 0}}
{% if activeArmor.definition.data.type == 'mediumArmor' -%}
**Dexterity Bonus** {% filter signed %}{% eval %}min({{data.abilities.dex.modifier}}, 2){% endeval %}{% endfilter %}
{% elif activeArmor.definition.data.type != 'heavyArmor' -%}
**Dexterity Bonus** {{data.abilities.dex.modifier|signed}}
{% endif -%}
{% else -%}
**Base Armor** 10
**Dexterity Bonus** {{data.abilities.dex.modifier|signed}}
{% endif -%}
{% if activeShield -%}
**{{activeShield.name}}** {{activeShield.definition.data.ac|default: 0|signed}}
{% endif -%}
{% for modifier in data.modifiers -%}
{% if modifier.attribute == 'data.ac' -%}
**{{ modifier.name }}** {{modifier|modifier}}
{% endif -%}
{% endfor %}
**Total Value** {{data.ac}}