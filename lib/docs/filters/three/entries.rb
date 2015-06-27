module Docs
  class Three
    class EntriesFilter < Docs::EntriesFilter
      def additional_entries
        type = nil
        entries = []

        css('h3').each do |node|
          type = node.content
          node.parent.css('ul > li > a').each do |el|
            # Build the URL

            puts '<< ' + base_url.to_s
            url = base_url.to_s + 'api/' + type.downcase + '/' + el.content + '.html'
            url.gsub!(/\s+/, '')
            puts '<< ' + url

            entries << [el.content, url, type]
          end
        end

        entries
      end
    end
  end
end
