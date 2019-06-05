require "before_filter_patch"

ActiveSupport::Reloader.to_prepare do
  ActionController::Base.send(:include, BeforeFilterPatch)
end
