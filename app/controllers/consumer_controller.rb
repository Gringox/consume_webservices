class ConsumerController < ApplicationController
  def check_service
    
    require 'open-uri'

    #resp1 = Nokogiri::XML(open("http://localhost:3000/service/server.xml")).content.strip
    #resp2 = Nokogiri::XML(open("http://localhost:3000/service/link.xml")).content.strip
    #resp3 = Nokogiri::XML(open("http://localhost:3000/service/router.xml")).content.strip

    doc1 = REXML::Document.new open "http://localhost/service/server.xml"
    doc2 = REXML::Document.new open "http://localhost/service/link.xml"
    doc3 = REXML::Document.new open "http://localhost/service/router.xml"

    if resp1 == '1' && resp2 == '1' && resp3 == '1'
      @result = resp1 + " * " + resp2 + " * " + resp3 + " = 1"
      @msg = "Los servicios estan disponibles!"
    else
      @result = resp1 + " * " + resp2 + " * " + resp3 + " = 0"
      @msg = "Los servicios no estan disponibles!"
    end

  end
end
