# frozen_string_literal: true
module ActiveAdmin
  module Generators
    class AssetsGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def install_assets
        remove_file "app/assets/javascripts/active_admin.js"

        if defined?(Tailwindcss::Engines)
          template "active_admin.css", "app/assets/tailwind/application.css"
        else
          template "active_admin.css", "app/assets/stylesheets/active_admin.css"

          remove_file "app/assets/builds/tailwind/active_admin.css"
          template "engine.css.erb", "app/assets/builds/tailwind/active_admin.css"
        end
      end
    end
  end
end
