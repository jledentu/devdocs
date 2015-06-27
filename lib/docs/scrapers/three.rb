module Docs
  class Three < UrlScraper
    include StubRootPage

    self.name = 'Three.js'
    self.type = 'three'
    self.slug = 'three'
    self.version = 'r71'
    self.base_url = 'http://threejs.org/docs/'
    self.links = {
      home: 'https://threejs.org/',
      code: 'https://github.com/mrdoob/three.js/'
    }

    html_filters.push 'three/entries', 'three/clean_html', 'title'

    options[:title] = 'Three.js'
    #options[:skip_links] = true

    options[:attribution] = <<-HTML
      &copy; 2010&ndash;2015 three.js authors<br>
      Licensed under the MIT License.
    HTML

    private

    def root_page_body
      require 'capybara'
      Capybara.current_driver = :selenium
      Capybara.visit(root_url.to_s)
      Capybara.find('#content')['innerHTML']
    end
  end
end
