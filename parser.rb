require 'json'

file = File.read(Dir.pwd + '/rollcall1.json')
file2 = File.read(Dir.pwd + '/rollcall2.json')
votes1 = JSON.parse(file)
votes2 = JSON.parse(file2)
# votes["TaggedPDF-doc"]["Part"].each do |key, value|

#   # puts key["Sect"]
#   # puts "------------------------------------------------------"
#   # puts key["Title"]
#   # puts "------------------------------------------------------"
#   # puts key["Table"]
# end

def eliminate_headers(json_obj)
  vote_record = json_obj["TaggedPDF-doc"]["Part"]
  vote_record[1..-1]
end

def grab_voted_on_legislation(json_obj)
  json_obj["TaggedPDF-doc"]
end

votes1["TaggedPDF-doc"]["Part"][1]["Table"]["TR"][1]["TD"]  #=> contains the Title of Legislation and City-Identifier


votes2.flatten[1]["Part"].each do |key, value|
  # puts key
  puts "========================="
  puts key["Sect"].flatten
  puts "========================="
end

puts "=============================================================="

# votes1.flatten[1]["Part"].each do |key, value|   #IT HAS NO VALUE ========     THIS IS FUCKED
#   puts key
#   puts "========================="
#   puts key["Sect"].length
#   puts "========================="
# end


# ORIGINAL STARTING POINT #############################################

# votes1.flatten[1]["Part"].each do |key, value|
#   puts "#{key} : #{value}"
#   puts "========================="

# end



