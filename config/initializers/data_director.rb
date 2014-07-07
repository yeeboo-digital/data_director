if Rails.configuration.cache_classes
  Formatters.install!
  Normalizers.install!
else
  ActionDispatch::Reloader.to_prepare do
    Formatters.install!
    Normalizers.install!
  end
end
