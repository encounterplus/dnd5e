
### {{name}} {{'Race.Traits'|l}}
{% trim %}
**{{'Species.CreatureType'|l}}:** {{data.creatureType|map: 'CreatureType'}}

**{{'Common.Size'|l}}:** {{data.size|map: 'Size'}}

**{{'Common.Speed'|l}}:** {% include "movement.md" data.speed %}
{% endtrim %}
{{'Race.YouHaveTheseSpecialTraits'|localize}}
{% for trait in data.traits %}
***{{trait.name}}.*** {{trait.text}}
{% endfor %}