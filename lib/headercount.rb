require 'net/http'
require 'uri'
require 'ssl_smtp'

class Message
  def initialize
    @email = 'chris@lissomesoftware.com'
    @password = 'YouWish'
    @port = 587
    @server = 'smtp.gmail.com'
    @name = 'Christopher Joslyn'
    @header = "From: #{@name} <#{@email}>\n" + "To: #{@name} <#{@email}>\n" + "Subject: A Website is Down\n\n"
  end
  
  def write(body)
    @text = @header + body
    self
  end
  
  def send
    Net::SMTP.start(@server, @port, @email, @email, @password, 'plain' ) do |smtp|
      smtp.send_message(@text, @email, @email)
    end
  end
end

class Headercount
  def initialize(domains)
    @urls = domains.collect { |d| URI.parse(d) }
  end
  
  def count
    @urls.each do |url|
      response = Net::HTTP.get_response(url)
      notify("#{url} Failed #{response.message}") if !successful?(response)
    end
  end
  
  def notify(text)
    Message.new.write(text).send
  end
  
  def successful?(response)
    response.kind_of? Net::HTTPSuccess
  end
end

Headercount.new(['http://lissomesoftware.com/wibble', 'http://ulstercountyalive.com']).count
