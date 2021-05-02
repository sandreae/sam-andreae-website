require "json"
require "yaml"

module Jekyll
  module DataQuery
    def url(input)
      people = @context.registers[:site].data['people']
      places = @context.registers[:site].data['places']

      people.each do |key, value|
        input.gsub! key, "<a href=\"https://#{value}\">#{key}</a>"
      end
      
      places.each do |key, value|
        input.gsub! key, "<a href=\"https://#{places[key]["url"]}\">#{key}</a>"
      end

      return input
    end
    
    def venue(input)
      places = @context.registers[:site].data['places']
  
      if places[input]
        return "<a href=\"https://#{places[input]["url"]}\">#{input}</a>, #{places[input]["city"]}"
      else
        return input
      end
    end
  end
end
  
Liquid::Template.register_filter(Jekyll::DataQuery)