require 'jekyll/scholar'

module Jekyll
  class Scholar
    class Href < BibTeX::Filter
      HREF_PATTERN = Regexp.compile('\\\\href\\{([^\\}]+)\\}\\{([^\\}]+)\\}')
      def apply(value)
        value.to_s.gsub(HREF_PATTERN) {
          if $2
            "<a href=\"#{$1}\">#{$2}</a>"
          else
            "<a href=\"#{$1}\">#{$1}</a>"
          end
        }
      end
    end
  end
end
