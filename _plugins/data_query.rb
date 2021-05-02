require "json"
require "yaml"

module Jekyll
  module DataQuery
    def _people()
      people_file = File.open File.expand_path('links/people.yml')
      return YAML.load(people_file)
    end

    def _places()
      places_file = File.open(File.expand_path('links/places.yml'))
      return YAML.load(places_file)
    end
        
    def url(input)
      people = self._people()
      places = self._places()

      people.each do |key, value|
        input.gsub! key, "<a href=\"https://#{value}\">#{key}</a>"
      end
      
      places.each do |key, value|
        input.gsub! key, "<a href=\"https://#{places[key]["url"]}\">#{key}</a>"
      end

      return input
    end
    
    def venue(input)
      places = self._places()
  
      if places[input]
        return "<a href=\"https://#{places[input]["url"]}\">#{input}</a>, #{places[input]["city"]}"
      else
        return input
      end
    end
  end
end
  
Liquid::Template.register_filter(Jekyll::DataQuery)