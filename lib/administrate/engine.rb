require "bourbon"
require "datetime_picker_rails"
require "jquery-rails"
require "kaminari"
require "momentjs-rails"
require "neat"
require "normalize-rails"
require "sass-rails"
require "selectize-rails"
require "sprockets/railtie"

require "administrate/page/form"
require "administrate/page/show"
require "administrate/page/collection"
require "administrate/order"
require "administrate/resource_resolver"
require "administrate/search"
require "administrate/namespace"

module Administrate
  class Engine < ::Rails::Engine
    isolate_namespace Administrate

    @@javascripts = []
    @@stylesheets = []

    # fix for: https://github.com/twbs/bootstrap-sass/issues/960
+   # regex no longer supported by assets.precompile
+   # sprockets-rails 3 tracks down the calls to `font_path` and `image_path`
+   # and automatically precompiles the referenced assets.
+   unless Sprockets::Rails::VERSION.starts_with?('3')
+     Engine.config.assets.precompile << /\.(?:svg)\z/
+   end

    def self.add_javascript(script)
      @@javascripts << script
    end

    def self.add_stylesheet(stylesheet)
      @@stylesheets << stylesheet
    end

    def self.stylesheets
      @@stylesheets
    end

    def self.javascripts
      @@javascripts
    end

    add_javascript "administrate/application"
    add_stylesheet "administrate/application"
  end
end
