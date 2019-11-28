
require('pry')
# binding.pry
# !!! exit pry

class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names
    planet_names = []
    # for planet in @planets
    #   planet_names << planet.name
    # end
    @planets.each { |planet| planet_names.push(planet.name)}
    return planet_names
  end

  def get_planet_by_name(name)
    planet_by_name = @planets.find { |planet| planet.name == name }
    return planet_by_name
  end

# match bigger_planet and planet order in pipes and in method after. Otherwise it returns minimum!!

  def get_largest_planet
    largest_planet = @planets.max() { |bigger_planet, planet | bigger_planet.diameter <=> planet.diameter}
    return largest_planet
  end

  def get_smallest_planet
    smallest_planet = @planets.min() { |smallest_planet, planet | smallest_planet.diameter <=> planet.diameter}
    return smallest_planet
  end

  def get_planets_with_no_moons
    planets_with_no_moons = @planets.find_all { |planet| planet.number_of_moons == 0}
    return planets_with_no_moons
  end

  def get_planets_with_more_moons(number)
    planets_with_more_moons = @planets.find_all { |planet| planet.number_of_moons > number }
    return planets_with_more_moons
  end

end
