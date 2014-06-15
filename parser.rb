require 'http://rubygems.org'
require 'json'
# # Dir["/json/*"].each {|file| p require file }
require 'rolecall1.json'

vote_data = File.open("rolecall1.json")
voting_hash = JSON.parse()

p council_votes
