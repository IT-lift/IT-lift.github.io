require 'json'

module Jekyll
  class PostIntroTag < Liquid::Tag

    def initialize(tag_name, input, tokens)
      super
      @input = input
    end

    def lookup(context, name)
      lookup = context
      name.split(".").each { |value| lookup = lookup[value] }
      lookup
    end

    def render(context)
      baseurl = "#{lookup(context, 'site.url')}"
      photo = ""
      author = ""
      position = ""
      text = ""

      begin
        if( !@input.nil? && !@input.empty? )
          jdata = JSON.parse(@input)
          
          photo = jdata["photo"]
          author = jdata["name"]
          position = jdata["position"]
          text = jdata["text"]
        end
      rescue
      end

      output = "<div class=\"author\">"
      output += "<div class=\"author__content\">"
      output += "<img src=\"#{baseurl}#{photo}\" width=\"140\" height=\"140\" class=\"author__photo\">"
      output += "<div>"
      output += "<div class=\"author__author\">"
      output += "<span class=\"author__name\">#{author}"
      if( !position.empty? )
        output += ",&nbsp;"
      end 
      output += "</span>"
      output += "<span class=\"author__position\">#{position}</span>"
      output += "</div>"
      output += "<div class=\"author__intro\">"
      output += "#{text}" 
      output += "</div>"
      output += "</div>"
      output += "</div>"
      output += "</div>"
    
      return output;
    end
  end
end

Liquid::Template.register_tag('post_intro', Jekyll::PostIntroTag)