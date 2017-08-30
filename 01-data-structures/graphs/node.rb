class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :connections
  
  def initialize(name)
    @name = name
    @connections = []
  end
  
  def actorNodes(movies)
    @film_actor_hash = Hash.new
    movies.each do |key, value|
      value.each do |node|
        if node.name == name
          @film_actor_hash[key] = value
          @film_actor_hash[key] -= [node]
        end
      end
    end
  end
end