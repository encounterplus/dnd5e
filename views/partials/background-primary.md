{% if data.abilities -%}
**{{'Background.AbilityScores'|l}}:** {{data.abilities|map: 'Ability'}}
{% endif -%}
{% if data.feat -%}
**{{'Entity.Feat'|l}}:** {{data.feat}}
{% endif -%}
{% if data.skills -%}
**{{'Background.SkillProficiencies'|l}}:** {{data.skills|map: 'Skill'}}
{% endif -%}
{% if data.tools -%}
**{{'Background.ToolProficiencies'|l}}:** {{data.tools|map: 'Tool'}}
{% endif -%}
{% if data.languages -%}
**{{'Background.Languages'|l}}:** {{data.languages|map: 'Language'}}
{% endif -%}
{% if data.equipment -%}
**{{'Background.Equipment'|l}}:** {{data.equipment}}
{% endif -%}