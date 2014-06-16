require 'json'

file = File.read(Dir.pwd + '/rollcall1.json')
file2 = File.read(Dir.pwd + '/rollcall2.json')
file3 = File.read(Dir.pwd + '/rollcall3.json')
file4 = File.read(Dir.pwd + '/rollcall4.json')
file5 = File.read(Dir.pwd + '/rollcall5.json')
file6 = File.read(Dir.pwd + '/rollcall6.json')
votes1 = JSON.parse(file)
votes2 = JSON.parse(file2)
votes3 = JSON.parse(file3)
votes4 = JSON.parse(file4)
votes5 = JSON.parse(file5)
votes6 = JSON.parse(file6)

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


# THIS SEEMS TO WORK FOR VOTES 1, 2 #############################################
#################################################################################
#################################################################################

def get_legislation_title_and_city_identifier(json)
  # THIS METHOD WILL HOUSE SOME COOL SHIT HOPEFULLY
  legislation_info = []
  table_length = json["TaggedPDF-doc"]["Part"][1]["Table"].length
  if table_length > 1
    json["TaggedPDF-doc"]["Part"][1]["Table"][0]["TR"].each do |header_hash|
      if header_hash.has_key?("TD")
        legislation_info << header_hash["TD"]  # LEGISLATION INFO ON EACH ORDINANCE
      end
    end
  else
    json["TaggedPDF-doc"]["Part"][1]["Table"]["TR"].each do |header_hash|
      if header_hash.has_key?("TD")
        legislation_info << header_hash["TD"]  # LEGISLATION INFO ON EACH ORDINANCE
      end
    end
  end
  legislation_info
end

# p get_legislation_title_and_city_identifier(votes1)
# p get_legislation_title_and_city_identifier(votes2)
# p get_legislation_title_and_city_identifier(votes3).length
# p get_legislation_title_and_city_identifier(votes4).length
# p get_legislation_title_and_city_identifier(votes5).length
p get_legislation_title_and_city_identifier(votes6).length





# THIS GETS US THE VOTES ---------------------------------------
def get_vote_tallies(json_votes)

  json_votes.flatten[1]["Part"].each do |key, value|
    votes_on_pending_legislation = []

    if key["Sect"].class == Array    # DOCUMENT WITH MULTIPLE ORDINANCES TO VOTE ON
      key["Sect"].each do |hash|
        if hash != nil && hash.has_key?("Table")
          votes = []
          hash['Table'].flatten.length
          hash["Table"].each do |table_hash|
            table_hash.each do |key, value|
              # puts "THIS #{key} : #{value}"
              value.each do |alderman_hash|
                # if alderman_hash["TH"]
                #   puts "This is a header"
                # end
                if alderman_hash["TD"]
                  # p alderman_hash["TD"]
                  votes << alderman_hash["TD"]
                end
                # p alderman_hash.values.flatten
              end
            end
          end
          votes_on_pending_legislation << votes
        elsif hash != nil && hash.has_key?("Sect")   # DOCUMENT WITH A SINGLE ORDINANCE TO VOTE ON
          votes = []
          hash["Sect"][1].each do |table_hash|
            table_hash.flatten.each do |vote_table|
              if vote_table["TR"].class == Array
                vote_table["TR"].each do |x|
                  # if x["TH"]
                  #   puts "THIS IS A HEADER"
                  # end
                  if x["TD"]
                    votes << x["TD"]  # THIS IS WHERE THE VOTES ARE...
                  end
                end
              end

            end
          end
          votes_on_pending_legislation << votes
        end
      end
    end
    puts "COMPARE LENGTH OF LEGISLATION INFO TO VOTE TALLIES"
    p votes_on_pending_legislation.length
  end
end




