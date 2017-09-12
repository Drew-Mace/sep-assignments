def nearest_neighbor(cities, current_city)
  # if current city wasn't visited
  while current_city.visited.true?
    # neighbor cities become cities of city you are currently in
    neighbor_cities = current_city.neighbors
    # tell us which city to go to next
    next_city = neighbor_cities[0]
    # checking to see if the neighbor city is closer than the city we have marked as our next visit
    for current_neighbor in neighbor_cities
      if current_neighbor.distance < next_city.distance
        # if it is then we will go there instead as it closer
        current_neighbor = next_city
      end
    end
    # mark the city we are in as visited and mark our current city as the one we are visiting next.
    current_city.visited = true
    next_city = current_city
  end
end


cities = #GRAPH OF ALL CITIES
current_city = #CITY WE ARE CURRENTLY IN; WOULD ALSO HAVE TO INCLUDE CITIES CLOSE TO IT (NEIGHBORS).