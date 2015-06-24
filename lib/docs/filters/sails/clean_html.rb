module Docs
  class Sails
    class CleanHtmlFilter < Filter
      def call
        doc.children = css('#readme > .entry-content').children

        css('h3').each do |el|
          el.name = 'h2'
        end

        doc
      end
    end
  end
end
