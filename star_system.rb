
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
    largest_planet = @planets.max() { | bigger_planet, planet | bigger_planet.diameter <=> planet.diameter}
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
    names_of_planets_with_more_moons = planets_with_more_moons.map { |planet| planet.name }
    return names_of_planets_with_more_moons
  end

  def get_number_of_planets_closer_than(distance)
    planets_closer_than = @planets.find_all { |planet| planet.distance_from_sun < distance }
    return planets_closer_than.count
  end

  def get_total_number_of_moons
    total_number_of_moons = @planets.reduce(0) { |running_total, current_planet| running_total + current_planet.number_of_moons }
    return total_number_of_moons
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    planets_sorted_by_distance = @planets.sort { |closest, current_planet| closest.distance_from_sun <=> current_planet.distance_from_sun }
    names_of_planets_sorted_by_distance = planets_sorted_by_distance.map { |planet| planet.name }
    return names_of_planets_sorted_by_distance
  end

  # def get_planet_names_sorted_by_size_decreasing
  #   planets_sorted_by_size = @planets.sort { |smallest, current_planet| current_planet.diameter <=> smallest.diameter }
  #   names_of_planets_sorted_by_size = planets_sorted_by_size.map { |planet| planet.name }
  #   return names_of_planets_sorted_by_size
  # end
  
  def get_planet_names_sorted_by_size_decreasing
    planets_sorted_by_size = @planets.sort { |smallest, current_planet| smallest.diameter <=> current_planet.diameter  }
    names_of_planets_sorted_by_size = planets_sorted_by_size.reverse.map { |planet| planet.name }
    return names_of_planets_sorted_by_size
  end

end
