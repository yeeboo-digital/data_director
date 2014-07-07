Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each {|l| load(l) }
# reload api on change if development
if Rails.env.development?
  
  core_ext_reloader = ActiveSupport::FileUpdateChecker.new(Dir["lib/core_ext/**/*"]) do
    Dir[File.join(Rails.root, "lib", "core_ext", "*.rb")].each {|l| load(l) }
  end

  ActionDispatch::Callbacks.to_prepare do
    core_ext_reloader.execute_if_updated
  end
  
end