{% if data.type == 'ship' %}
**{{'Vehicle.CreatureCapacity'|l}}** {{data.crew|suffix: ' crew, '}}{{data.passengers|suffix: ' passengers '}}
**{{'Vehicle.CargoCapacity'|l}}** {{data.cargo}}
{% elif data.type == 'infernalWarMachine' %}
**{{'Vehicle.CreatureCapacity'|l}}** {{data.crew}}
**{{'Vehicle.CargoCapacity'|l}}** {{data.cargo}}
**{{'Common.ArmorClass'|l}}** {{data.ac}}
**{{'Common.HitPoints'|l}}** {{data.hp}} {{data.dt|prefix: 'damage threshold '|brackets}}
**{{'Common.Speed'|l}}** {{data.speed}}
{% elif data.type == 'spelljammerShip' %}
**{{'Common.ArmorClass'|l}}** {{data.ac}}
**{{'Common.HitPoints'|l}}** {{data.hp}}
**{{'Vehicle.DamageThreshold'|l}}** {{data.dt}}
**{{'Common.Speed'|l}}** {{data.speed}}
**{{'Vehicle.Cargo'|l}}** {{data.cargo}}
**{{'Vehicle.Crew'|l}}** {{data.crew}}
**{{'Vehicle.KeelBeam'|l}}** {{data.dimensions}}
**{{'Vehicle.Cost'|l}}** {{data.cost}}
{% else %}
**{{'Common.ArmorClass'|l}}** {{data.ac}}
**{{'Common.HitPoints'|l}}** {{data.hp}}
**{{'Vehicle.DamageThreshold'|l}}** {{data.dt}}
**{{'Common.Speed'|l}}** {{data.speed}}
**{{'Vehicle.Cargo'|l}}** {{data.cargo}}
**{{'Vehicle.Crew'|l}}** {{data.crew}}
**{{'Vehicle.Cost'|l}}** {{data.cost}}
{% endif %}