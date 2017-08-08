# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members
  attr_accessor :person

  def initialize
    self.members = []
    self.person = ""
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    members.delete(person)
  end

  def front
    members.first
  end

  def middle
    mid = members.length / 2
    if mid.odd?
      mid - members.length - 1
      members[mid]
    else
      members[mid]
    end
  end

  def back
    members.last
  end

  def search(person)
    members.detect { |p| p == person}
  end

  private

  def index(person)
    members.each { |person| print person, " "}
  end

end