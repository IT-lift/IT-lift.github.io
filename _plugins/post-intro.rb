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

      output =
        "<div class=\"author\">"\
          "<div class=\"author__content\">"\
            "<img src=\"#{baseurl}#{photo}\" width=\"140\" height=\"140\" class=\"author__photo\">"\
            "<div>"\
              "<span class=\"author__label\">Автор поста </span>"\
              "<div class=\"author__author\">"\
                "<span class=\"author__name\">#{author}"
      if( !position.nil? && !position.empty? )
        output +=",&nbsp;"
      end
      output +=
                "</span>"\
                "<span class=\"author__position\">#{position}</span>"\
              "</div>"\
              "<div class=\"author__intro\">#{text}</div>"\
            "</div>"\
          "</div>"\
        "</div>"
    
      return output;
    end
  end
end

Liquid::Template.register_tag('post_intro', Jekyll::PostIntroTag)