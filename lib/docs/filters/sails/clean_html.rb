module Docs
  class Sails
    class CleanHtmlFilter < Filter
      def call

        # Remove ng-* attributes
        css('*').each do |node|
          node.attributes.each_key do |attribute|
            node.remove_attribute(attribute) if attribute.start_with? 'ng-'
          end
        end

        css('.book-wrapper-banner').remove

        doc
      end
    end
  end
end
