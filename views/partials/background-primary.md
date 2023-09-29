{% if data.skills -%}
**Skill Proficiencies:** {{data.skills|map: 'Skill'}}
{% endif -%}
{% if data.tools -%}
**Tool Proficiencies:** {{data.tools|map: 'Tool'}}
{% endif -%}
{% if data.languages -%}
**Languages:** {{data.languages|map: 'Language'}}
{% endif -%}
{% if data.equipment -%}
**Equipment:** {{data.equipment}}
{% endif -%}