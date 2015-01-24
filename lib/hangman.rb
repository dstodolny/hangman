require 'open-uri'
require 'pstore'

require_relative 'hangman/version'

module Hangman; end

lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + '/hangman/**/*.rb'].each { |file| require file }
