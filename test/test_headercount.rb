require 'test/unit'
require 'must'
require '../lib/headercount'

class HeadercountTest < Test::Unit::TestCase
  def setup
    @headercount = Headercount::Thing.new
  end
  
  must "return false when response is not successful" do
    response = Net::HTTP.get_response(URI.parse('http://lissomesoftware.com/wibble'))
    assert ! @headercount.successful?(response)
  end
  
  must "return true when reponse is successful" do
    response = Net::HTTP.get_response(URI.parse('http://lissomesoftware.com'))
    assert @headercount.successful?(response)
  end
end