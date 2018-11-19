require 'hashie'
require 'pry'
require 'httparty'
require 'json'

response = HTTParty.get("https://raw.githubusercontent.com/jdolan/quetoo/master/src/cgame/default/ui/settings/SystemViewController.json")
@data = JSON.parse(response.body)

@data.extend Hashie::Extensions::DeepFind
@classes = @data.deep_find_all("class")
@classNames = @data.deep_find_all("classNames")
@identifiers = @data.deep_find_all("identifier")

def self.search
  puts "Enter a class, class name, or identifier as a selector:"
  user_input = gets.chomp
  @data.extend Hashie::Extensions::DeepLocate

  if @classNames.flatten.include?(user_input)
    results = @data.deep_locate -> (key, value, object) { key == "classNames" && value.include?("#{user_input}") }
  elsif @identifiers.include?(user_input)
    results = @data.deep_locate -> (key, value, object) { key == "identifier" && value.include?("#{user_input}") }
  else
    results = @data.deep_locate -> (key, value, object) { key == "class" && value.include?("#{user_input}") }
  end

  counter = 1
  if results.length == 0
    puts "NO RESULTS"
  else
    puts "\nRESULTS:\n\n"
    results.each do |value|
    puts "#{counter} #{value}\n\n"
    counter+=1
    end
  end

  puts "Search again? (y/n)"
  command = gets.chomp
  if command == "y"
    self.search
  else command =="n"
    return
  end
end

self.search
