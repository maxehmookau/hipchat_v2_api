require "minitest/autorun"
require 'hipchat_v2_api'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures'
  c.hook_into :webmock
end