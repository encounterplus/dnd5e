{% if data.type == 'ship' %}
**{{'Vehicle.CreatureCapacity'|l}}** {{data.crew|suffix: ' crew, '}}{{data.passengers|suffix: ' passengers '}}
**{{'Vehicle.CargoCapacity'|l}}** {% if data.cargo >= 2000 %}{% eval %}{{data.cargo}} / 2000{% endeval %} ton{% if data.cargo > 2000 %}s{% endif %}{% else %}{{data.cargo|units: 'lb'}}{% endif %}
{% elif data.type == 'infernalWarMachine' %}
**{{'Vehicle.CreatureCapacity'|l}}** {{data.crew}}
**{{'Vehicle.CargoCapacity'|l}}** {% if data.cargo >= 2000 %}{% eval %}{{data.cargo}} / 2000{% endeval %} ton{% if data.cargo > 2000 %}s{% endif %}{% else %}{{data.cargo|units: 'lb'}}{% endif %}
**{{'Common.HitPoints'|l}}** {{data.hp}} {% if data.damageThreshold and data.mishapThreshold %}({{data.damageThreshold|prefix: 'damage threshold '}}, {{data.mishapThreshold|prefix: 'mishap threshold '}}){% elif data.damageThreshold %}({{data.damageThreshold|prefix: 'damage threshold '}}){% elif data.mishapThreshold %}({{data.mishapThreshold|prefix: 'mishap threshold '}}){% endif %}
**{{'Common.Speed'|l}}** {{data.speed}}
{% elif data.type == 'spelljammerShip' %}
**{{'Common.ArmorClass'|l}}** {{data.ac}}
**{{'Common.HitPoints'|l}}** {{data.hp}}
**{{'Vehicle.DamageThreshold'|l}}** {{data.damageThreshold}}
**{{'Common.Speed'|l}}** {{data.speed}}
**{{'Vehicle.CargoCapacity'|l}}** {% if data.cargo >= 2000 %}{% eval %}{{data.cargo}} / 2000{% endeval %} ton{% if data.cargo > 2000 %}s{% endif %}{% else %}{{data.cargo|units: 'lb'}}{% endif %}
**{{'Vehicle.Crew'|l}}** {{data.crew}}
**{{'Vehicle.KeelBeam'|l}}** {{data.dimensions}}
**{{'Vehicle.Cost'|l}}** {{data.cost|units: 'gp'}}
{% else %}
**{{'Common.ArmorClass'|l}}** {{data.ac}}
**{{'Common.HitPoints'|l}}** {{data.hp}}
**{{'Vehicle.DamageThreshold'|l}}** {{data.damageThreshold}}
**{{'Common.Speed'|l}}** {{data.speed}}
**{{'Vehicle.CargoCapacity'|l}}** {% if data.cargo >= 2000 %}{% eval %}{{data.cargo}} / 2000{% endeval %} ton{% if data.cargo > 2000 %}s{% endif %}{% else %}{{data.cargo|units: 'lb'}}{% endif %}
**{{'Vehicle.Crew'|l}}** {{data.crew}}
**{{'Vehicle.Cost'|l}}** {{data.cost|units: 'gp'}}
{% endif %}