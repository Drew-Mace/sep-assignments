def poorly_written_ruby(*arrays)
  big = []
  arrays.each do |value|
   big.push(value)
 end
  big.flatten!
  big.sort
end