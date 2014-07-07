#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

DataDirector::Application.load_tasks

$:.unshift File.join(File.dirname(__FILE__), *%w[lib])

require "bundler"
require "rake"
require 'fileutils'
require 'pry'

namespace :director do
  
  desc "DATA_TYPE=tag,tag2 rake director:import file.csv file2.csv"
  task :import => [:environment] do
    raise ArgumentError.new("You must provide DATA_TYPE=type,type2") unless ENV['DATA_TYPE'].present?
    require 'data_director/import'
    # each file
    ARGV[1..-1].each do |file|
      # skip junk
      next unless File.exists?(file)
      # each record of data
      DataDirector::Import.new(file).each do |data, line|
        # create a row
        SupporterRow.create( data_attributes: data, data_line: line, data_file: file, data_type: ENV['DATA_TYPE'] )
      end
    end
  end
  
  desc "normalize"
  task :normalize => [:environment] do
    SupporterRow.find_each(&:normalize!)
  end
  
  desc "format"
  task :format => [:environment] do
    Supporter.find_each(&:format!)
  end
  
end