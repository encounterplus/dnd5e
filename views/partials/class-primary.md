# {{'Class.ClassFeatures'|l}}

{{'Class.YouGainFollowingClassFeatures'|localize}}

### {{'Common.HitPoints'|l}}

**{{'Class.HitDice'|l}}:** 1d{{data.hd|default: 10}} {{'Class.PerClassLevel'|localize}}
**{{'Class.HitPointsAt1stLevel'|l}}:** {{data.hd|default: 10}} + {{'Class.YourConstitutionModifier'|l}}
**{{'Class.HitPointsAtHigherLevels'|l}}:**  1d{{data.hd|default: 10}} {{data.hd||default: 10|diceAverage|brackets}} + {{'Class.YourConstitutionModifierAfter1stLevel'|localize}}

### {{'Class.Proficiencies'|l}}

{% if data.armor -%}
**{{'Class.Armor'|l}}:** {{data.armor|map: 'Armor'}}
{% endif -%}
{% if data.weapons -%}
**{{'Class.Weapons'|l}}:** {{data.weapons|map: 'Weapon'}}
{% endif -%}
{% if data.tools -%}
**{{'Class.Tools'|l}}:** {{data.tools|map: 'Tool'}}
{% endif -%}
{% if data.savingThrows -%}
**{{'Class.SavingThrows'|l}}:** {{data.savingThrows|map: 'Ability'}}
{% endif -%}
{% if data.skills -%}
**{{'Class.Skills'|l}}:** Choose {{data.skillsNumber|default: 'any'}} from {{data.skills|map: 'Skill'}}
{% endif -%}

### {{'Class.StartingEquipment '|l}}

{{data.equipment}}