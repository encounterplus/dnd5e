function migrate(entity, migration) {
  // change character race to species
  if (entity.kind === "Character") {
    var data = entity.data
    const race = data.race
    if (race && !data.species) {
      data.species = race
      delete data.race
    }

    entity.data = data
    return entity
  }

  // return null to indicate no changes were made
  return null
}