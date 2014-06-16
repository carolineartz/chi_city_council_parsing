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

p votes1["TaggedPDF-doc"]["Part"][1]["Table"]["TR"][1]["TD"]  #=> contains the Title of Legislation and City-Identifier

puts "---------------------------------------------------------------"


# eliminate_headers(votes2).each do |ordinance|
#   p ordinance["Table"]
#   puts "---------------------------------------------------------------"
# end
# p votes2["TaggedPDF-doc"]["Part"][1]["Table"]["TR"][1]["TD"]

# puts "---------------------------------------------------------------"

# p votes2["TaggedPDF-doc"]["Part"][0]
# p votes2["TaggedPDF-doc"]["Part"][1]
# p votes2["TaggedPDF-doc"]["Part"][2]
# p votes1["TaggedPDF-doc"]["Part"][1]["Table"]["TR"][1]["TD"]




puts "=============================================================="



