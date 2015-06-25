module Docs
  class Sails < UrlScraper

    self.name = 'Sails.js'
    self.slug = 'sails'
    self.type = 'sails'
    self.version = '0.11'
    self.base_url = 'https://github.com/balderdashy/sails-docs/'
    self.root_path = 'tree/master/reference'
    self.links = {
      home: 'http://sailsjs.org/',
      code: 'https://github.com/balderdashy/sails'
    }

    html_filters.push 'sails/clean_html', 'sails/entries'

    options[:title] = 'Sails.js'
    options[:container] = '.repository-content'

    options[:skip_patterns] = [/0home/, /README\.md\z/]
    options[:only_patterns] = [/tree\/master\/reference/, /blob\/master\/reference.*\.md\.html\z/]

    options[:fix_urls] = ->(url) do
      url.sub! '/blob/master/', '/tree/master/'
      url
    end

    options[:attribution] = <<-HTML
      &copy; 2015 Mike McNeil and Balderdash Design Co.<br>
      Licensed under the MIT License.
    HTML
  end
end
