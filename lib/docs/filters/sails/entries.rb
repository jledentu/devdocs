module Docs
  class Sails
    class EntriesFilter < Docs::EntriesFilter

      TYPES = {
        'blueprint-api' => 'Blueprint API',
        'cli' => 'Command Line Interface',
        'req' => 'Request (`req`)',
        'res' => 'Response (`res`)',
        'sails.config' => 'Configuration',
        'waterline' => 'Waterline (ORM)',
        'websockets' => 'WebSockets'
      }

      def get_name
        if at_css('h1')
          return at_css('h1').content
        end
      end

      def get_type
        type = slug.split('/')[3]
        type = TYPES[type] || type
      end

      def include_default_entry?
        at_css('h1') && !root_page?
      end

    end
  end
end
