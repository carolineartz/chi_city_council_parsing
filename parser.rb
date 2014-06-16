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

# votes1["TaggedPDF-doc"]["Part"][1]["Table"]["TR"][1]["TD"]  #=> contains the Title of Legislation and City-Identifier


# THIS SEEMS TO WORK FOR VOTES 1, 2

votes1["TaggedPDF-doc"]["Part"][1]["Table"]["TR"].each do |header_hash|
  if header_hash.has_key?("TD")
    puts header_hash["TD"]  # Legislation Info
    puts "======================================================"
  end
end



# THIS GETS US THE VOTES ---------------------------------------

votes1.flatten[1]["Part"].each do |key, value|

  if key["Sect"].class == Array
    key["Sect"].each do |hash|
      if hash != nil && hash.has_key?("Table")
        hash["Table"].each do |table_hash|
          table_hash.each do |key, value|
            # puts "THIS #{key} : #{value}"
            value.each do |alderman_hash|
              p alderman_hash.values.flatten
              puts "-------------------------------------------------------"
            end
          end
        end
      elsif hash.has_key?("Sect")

        hash["Sect"][1].each do |table_hash|

          table_hash.flatten.each do |vote_hash|

          end
        end



      end
    end
  end
end


puts "-------------------------------------------------------"
puts "-------------------------------------------------------"
puts "-------------------------------------------------------"

# votes1.flatten[1]["Part"].each do |key, value|
#   # puts "========================="
#   # puts key["Sect"]
#   # puts "========================="
#   # puts value
#   puts "=============================================================="
#   if key["Sect"].class == Array
#     puts "yea"
#     key["Sect"].each do |hash|
#       puts "++++++++++++++++++++++++++++++++++++++"
#       puts hash
#       puts "++++++++++++++++++++++++++++++++++++++"
#     end
#   end
# end


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



