require "json"
require "yaml"

module Jekyll
  module PersonFilter
    def url(input)
      people_file = File.open File.expand_path('links/people.json')
      people = JSON.load people_file

      places_file = File.open(File.expand_path('links/places.yml'))
      places = YAML.load(places_file)

      if people[input]
        return "<a href=\"https://#{people[input]}\">#{input}</a>"
      elsif places[input]
        return "<a href=\"https://#{places[input]["url"]}\">#{input}</a>"
      else
        return input
      end
    end
    
    def venue(input)
      places_file = File.open(File.expand_path('links/places.yml'))
      places = YAML.load(places_file)
        
      if places[input]
        return "<a href=\"https://#{places[input]["url"]}\">#{input}</a>, #{places[input]["city"]}"
      else
        return input
      end
    end
  end
end
  
Liquid::Template.register_filter(Jekyll::PersonFilter)