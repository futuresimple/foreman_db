require 'rubygems'
require 'bundler'

Bundler.require
require 'vcr'
require 'webmock/rspec'

require File.join(File.dirname(__FILE__), "../lib/foreman_db")

# set cofnig for test environment
ENV["FOREMAN_URL"] = "https://foreman.local"
ENV["FOREMAN_USER"] = "user"
ENV["FOREMAN_PASS"] = "pass"

VCR.configure do |c|
  c.cassette_library_dir = File.join(File.dirname(__FILE__), 'fixtures/vcr_cassettes')
  c.hook_into :webmock
end
