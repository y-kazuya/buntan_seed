require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BuntanSeed
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.i18n.fallbacks = [I18n.default_locale]
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    Rails.configuration.action_controller.per_form_csrf_tokens = true
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      if instance.kind_of?(ActionView::Helpers::Tags::Label)
        html_tag.html_safe
      else
        Nokogiri::HTML.fragment(html_tag).search('input', 'textarea', 'select').add_class('is-error').to_html.html_safe
      end
    end
    config.i18n.default_locale = :ja
  end
end
