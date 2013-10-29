require 'test_helper'

class HipchatV2ApiTest < Minitest::Test

  def setup
    @test_object = HipchatV2Api::Connection.new
  end
  def test_creating_base_object
    assert_equal HipchatV2Api::Connection, @test_object.class
  end

  def test_setting_the_api_key
    @test_object.api_key = 'ABCDE'
    assert_equal 'ABCDE', @test_object.api_key
  end

  def test_checking_invalid_api_key
    VCR.use_cassette('test_checking_invalid_api_key') do
      @test_object.api_key = 'ABCDE'
      assert_equal false, @test_object.is_authorized?
    end
  end

  def test_checking_valid_api_key
    VCR.use_cassette('test_checking_valid_api_key', match_requests_on: [:path]) do
      @test_object.api_key = 'thisisavalidkey'
      assert_equal true, @test_object.is_authorized?
    end
  end
end