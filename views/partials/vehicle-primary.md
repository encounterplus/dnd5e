{% if data.type == 'ship' %}
**Creature Capacity** {{data.crew|suffix: ' crew, '}}{{data.passengers|suffix: ' passengers '}}
{{data.cargo|prefix: '**Cargo Capacity** '}}
{% elif data.type == 'infernalWarMachine' %}
{{data.crew|prefix: '**Creature Capacity** '}}
{{data.cargo|prefix: '**Cargo Capacity** '}}
{{data.ac|prefix: "**Armor Class** "}}
**Hit Points** {{data.hp}} {{data.dt|prefix: 'damage threshold '|brackets}}
{{data.speed|prefix: "**Speed** "}}
{% elif data.type == 'spelljammerShip' %}
{{data.ac|prefix: "**Armor Class** "}}
{{data.hp|prefix: "**Hit Points** "}}
{{data.dt|prefix: "**Damage Threshold** "}}
{{data.speed|prefix: "**Speed** "}}
{{data.cargo|prefix: "**Cargo** "}}
{{data.crew|prefix: "**Crew** "}}
{{data.dimensions|prefix: "**Keel/Beam** "}}
{{data.cost|prefix: "**Cost** "}}
{% else %}
{{data.ac|prefix: "**Armor Class** "}}
{{data.hp|prefix: "**Hit Points** "}}
{{data.dt|prefix: "**Damage Threshold** "}}
{{data.speed|prefix: "**Speed** "}}
{{data.cargo|prefix: "**Cargo** "}}
{{data.crew|prefix: "**Crew** "}}
{{data.cost|prefix: "**Cost** "}}
{% endif %}