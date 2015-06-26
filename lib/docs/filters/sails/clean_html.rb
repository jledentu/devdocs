module Docs
  class Sails
    class CleanHtmlFilter < Filter
      def call
        doc.children = css('#readme > .entry-content').children

        css('h3').each do |node|
          node.name = 'h2'
        end

        css('pre > code').each do |node|
          node.parent['class'] = node['class']
          node.before(node.children).remove
        end

        css('.highlight').each do |node|
          node.name = 'pre'
          node.content = node.at_css('pre').content
        end

        doc
      end
    end
  end
end
