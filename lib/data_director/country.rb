# encoding: UTF-8

require 'ostruct'
require 'json'

module DataDirector
class Country
  class << self
    
    def parse(key)
      return nil if key.nil?
      key = sanitize_name(key)
      return countries[key].code if countries.has_key?(key)
      Rails.logger.warn("WARN | no translation found for country: '#{key}'")
      nil
    end
    
    def countries
      @countries ||= load
    end
    
    def sanitize_name(name)
      name.to_s.downcase.strip.rstrip.gsub(" ", "_")
    end
    
    def load
      output = {}
      data = JSON.parse(File.read(config_path)).collect{|c| self.new(c) }
      data.each do |country|
        output[ sanitize_name(country.name) ] = country
        output[ country.code ] = country
      end
      output
    end
    
    def config_path
      File.join(Rails.root, 'config/countries.json')
    end
    
  end
  
  attr_accessor :name, :code, :numeric_code
  
  def initialize(attrs)
    self.name = attrs['name']
    self.code = attrs['alpha-2']
    self.numeric_code = attrs['country-code']
  end
  
  def to_sym
    code.to_sym
  end
  
  def to_s
    code
  end
  
end
end