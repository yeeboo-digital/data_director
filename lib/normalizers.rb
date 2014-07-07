module Normalizers
  class << self
    
    ORDER = [
      :email
    ]
    
    def install!
      ORDER.each{|f| load("#{Rails.root}/lib/normalizers/#{f}.rb") }
      Dir["#{Rails.root}/lib/normalizers/*.rb"].each{|f| load(f) }
    end
    
  end
end