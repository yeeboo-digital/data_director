module Formatters
  class << self
    def install!
      Dir["#{Rails.root}/lib/formatters/*.rb"].each{|f| load(f) }
    end
  end
end