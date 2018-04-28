require 'json'

module Jekyll
  class PostQuoteTag < Liquid::Tag

    def initialize(tag_name, input, tokens)
      super
      @input = input
    end

    def render(context)
      author = ""
      position = ""
      text = ""

      begin
        if( !@input.nil? && !@input.empty? )
          jdata = JSON.parse(@input)
          
          author = jdata["name"]
          position = jdata["position"]
          text = jdata["text"]
        end
      rescue
      end

      output = "<div class=\"post-quote\">"
      output += "<div class=\"post-quote__quote\">"
      output += "#{text}"
      output += "</div>"
      output += "<div class=\"post-quote-author\">"
      output += "<span class=\"post-quote-author__name\">#{author}"
      if( !position.empty? )
        output += ",&nbsp;"
      end 
      output += "</span>"
      output += "<span class=\"post-quote-author__position\">#{position}</span>"
      output += "</div>"
      output += "</div>"
    
      return output;
    end
  end
end

Liquid::Template.register_tag('post_quote', Jekyll::PostQuoteTag)