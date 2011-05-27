module Jekyll
  class AsciiConverter < Converter
    safe true

    priority :low

    def setup
      return if @setup
      require 'github/markup'
      @setup = true
    end

    def matches(ext)
      ext =~ /(txt|adoc|asciidoc)/i
    end 

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      setup
      begin
        GitHub::Markup.render('thing.asciidoc',content)
      rescue => e
        puts "asciidoc exception: #{e.message}"
      end
    end
  end
end

