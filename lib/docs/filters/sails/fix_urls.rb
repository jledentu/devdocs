module Docs
  class Sails
    class FixUrlsFilter < Filter

      def call
        css('a').each do |node|
          url = node['href']
          if url
          url.gsub! %r{^(?:\./)?#!/documentation/reference/([^"']+?)/([^/"']+?)(?:\.html)?$}, 'http://sailsjs.org/templates/reference/\1/\2.html'
          url.gsub! %r{^(?:\./)?#!/documentation/reference/([^/"']+?)(?:\.html)?$}, 'http://sailsjs.org/templates/reference/\1/\1.html'
          puts '>> ' + url
          node['href'] = url
          end
        end

        doc
      end

    end
  end
end
