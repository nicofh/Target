Rails.application.config.assets.configure do |env|
  env.context_class.class_eval do
    include ApplicationHelper
    include Rails.application.routes.url_helpers
  end
end
