require_relative 'node'

class Graph
  
  def find_kevin_bacon(start)
    actorToFind = []
    foundThem = false
    actorToFind.push(start)
    while(actorToFind != 0)
      node = actorToFind.shift
      node.film_actor_hash.each do |movie, actor|
        if !start.connections.include?(movie)
          start.connections.push(movie)
        end
        actor.each do |actor|
          if actor.name != "Kevin Bacon" && !actorToFind.include?(actor)
            actorToFind.push(actor)
          end
          if actor.name == "Kevin Bacon"
            foundThem = true
            return start.connections
          end
        end
      end
    end
    return "Kevin Bacon is a crafty man, he has evaded your search"
  end
end