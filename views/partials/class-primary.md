# Class Features

As a {{name|lowercase}}, you gain the following class features.

### Hit Points

**Hit Dice:** 1d{{data.hd|default: 10}}
**Points at 1st Level:** {{data.hd|default: 10}} + your Constitution modifier
**Hit Points at Higher Levels:**  1d{{data.hd|default: 10}} (or {{data.hd||default: 10|diceAverage}}) + your Constitution modifier per {{name}} level after 1st

### Proficiencies

{% if data.armor -%}
**Armor:** {{data.armor|map: 'Armor'}}
{% endif -%}
{% if data.weapons -%}
**Weapons:** {{data.weapons|map: 'Weapon'}}
{% endif -%}
{% if data.tools -%}
**Tools:** {{data.tools|map: 'Tool'}}
{% endif -%}
{% if data.savingThrows -%}
**Saving Throws:** {{data.savingThrows|map: 'Ability'}}
{% endif -%}
{% if data.skills -%}
**Skills:** Choose {{data.skillsNumber|default: 'any'}} from {{data.skills|map: 'Skill'}}
{% endif -%}

### Starting Equipment 

{{data.equipment}}