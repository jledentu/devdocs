module Docs
  class Sails < UrlScraper
    include StubRootPage

    self.name = 'Sails.js'
    self.slug = 'sails'
    self.type = 'sails'
    self.version = '0.11'
    self.base_url = 'http://sailsjs.org/templates/reference/'
    self.links = {
      home: 'http://sailsjs.org/',
      code: 'https://github.com/balderdashy/sails'
    }

    html_filters.insert_before 'normalize_urls', 'sails/fix_urls'
    html_filters.push 'sails/clean_html', 'sails/entries'

    options[:title] = 'Sails.js'
    options[:skip_links] = false

    options[:attribution] = <<-HTML
      &copy; 2015 Mike McNeil and Balderdash Design Co.<br>
      Licensed under the MIT License.
    HTML

    def root_page_body
      require 'capybara'
      Capybara.current_driver = :selenium
      Capybara.visit(base_url + '/#!/documentation/reference/')
      Capybara.find('.reference-sidebar')['innerHTML']
    end
  end
end
