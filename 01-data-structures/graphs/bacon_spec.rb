include RSpec

require_relative 'kBacon'
require_relative 'node'

RSpec.describe Graph, type: Class do
  
  let(:graph) { Graph.new }
  
  let(:kevin_bacon) { Node.new("Kevin Bacon") }
  let(:john_vernon) { Node.new("John Vernon") }
  let(:jodi_foster) { Node.new("Jodi Foster") }
  let(:christopher_haskell) { Node.new("Christopher Haskell") }
  let(:rhys_darby) { Node.new("Rhys Darby") }
  let(:stacey_forbes_iwanicki) { Node.new("Stacey Forbes Iwanicki") }
  let(:robert_downey_jr) { Node.new("Robert Downey Jr.") }
  let(:chris_evans) { Node.new("Chris Evans") }
  let(:tony_curran) { Node.new("Tony Curran") }
  let(:jet_li) { Node.new("Jet Li") }
  let(:mickey_rourke) { Node.new("Mickey Rourke") }
  #outside 6th degree
  let(:ab) { Node.new("ab") }
  let(:ba) { Node.new("ba") }
  let(:ac) { Node.new("ac") }
  let(:ca) { Node.new("ca") }
  let(:bc) { Node.new("bc") }
  let(:cd) { Node.new("cd") }
  let(:dc) { Node.new("dc") }
  
  # no connection
  let(:tom_tom) { Node.new("Tom Tom") }
  
  let(:movies) { Hash.new }
  
  before do 
    movies["Animal House"] = [kevin_bacon, john_vernon]
    movies["Les Sang des autres"] = [john_vernon, jodi_foster]
    movies["Frost/Nixon"] = [kevin_bacon, christopher_haskell]
    movies["Yes Man"] = [christopher_haskell, rhys_darby]
    movies["R.I.P.D"] = [kevin_bacon, stacey_forbes_iwanicki]
    movies["The Judge"] = [robert_downey_jr, stacey_forbes_iwanicki]
    movies["Postman Pat: The Movie"] = [chris_evans, tony_curran]
    movies["X-Men: First Class"] = [kevin_bacon, tony_curran]
    movies["The Expendables"] = [jet_li, mickey_rourke]
    movies["Diner"] = [mickey_rourke, kevin_bacon]
    #outside 6th degree
    movies["Fake 1"] = [ab, ba]
    movies["Fake 2"] = [ba, ac]
    movies["Fake 3"] = [ac, ca]
    movies["Fake 4"] = [ca, bc]
    movies["Fake 5"] = [bc, cd]
    movies["Fake 6"] = [cd, dc]
    movies["Fake 7"] = [kevin_bacon, dc]
    
    

    kevin_bacon.actorNodes(movies)
    john_vernon.actorNodes(movies)
    jodi_foster.actorNodes(movies)
    christopher_haskell.actorNodes(movies)
    rhys_darby.actorNodes(movies)
    stacey_forbes_iwanicki.actorNodes(movies)
    robert_downey_jr.actorNodes(movies)
    chris_evans.actorNodes(movies)
    tony_curran.actorNodes(movies)
    jet_li.actorNodes(movies)
    mickey_rourke.actorNodes(movies)
    #fake actor
    tom_tom.actorNodes(movies)
    #outside of 6th degree
    ab.actorNodes(movies)
    ba.actorNodes(movies)
    ac.actorNodes(movies)
    ca.actorNodes(movies)
    bc.actorNodes(movies)
    cd.actorNodes(movies)
    dc.actorNodes(movies)
  end
  
  describe "match found" do
    it "finds Jet Li" do
      find_bacon_and_li = ["The Expendables", "Diner"]
      expect(graph.find_kevin_bacon(jet_li)).to eq(find_bacon_and_li)
    end
  end
  
  describe "ensure actor can be found outside of the 6th degree" do
   it "found them" do
     find_bacon_anyway = ["Fake 1", "Fake 2", "Fake 3", "Fake 4", "Fake 5", "Fake 6", "Fake 7"]
     expect(graph.find_kevin_bacon(ab)).to eq(find_bacon_anyway)
   end
  end

  
  describe "No connection made" do
    it "burnt the bacon" do
      find_bacon_and_tom_tom = graph.find_kevin_bacon(tom_tom)
      expect(find_bacon_and_tom_tom).to eq("Bacon has been burnt. No match found")
    end
  end
end
  