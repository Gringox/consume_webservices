class SebastianController < ApplicationController

  def check_service
    
    require 'open-uri'

    #url1 = "http://elmanguareo.no-ip.org:8082/LinkModuleWS/DisponibilidadServlet?nombre=link&mes=1&ano=2013&flagDisponibilidad=true"
    #url2 = "http://elmanguareo.no-ip.org:8082/RouterWS/DisponibilidadServlet?nombre=router&mes=1&ano=2013&flagDisponibilidad=true"
    #url3 = "http://elmanguareo.no-ip.org:8082/ServidorWS/DisponibilidadServlet?nombre=server&mes=1&ano=2013&flagDisponibilidad=true"

    #url1 = File.read(File.join(Rails.root, 'public','example.xml'))
    #url2 = File.read(File.join(Rails.root, 'public','example.xml'))
    #url3 = File.read(File.join(Rails.root, 'public','example.xml'))

    url1 = "http://localhost/service/servidor/S1.xml?mes=5&ano=2015"
    url2 = "http://localhost/service/enlace/E1.xml?mes=5&ano=2015"
    url3 = "http://localhost/service/router/R1.xml?mes=5&ano=2015"
    
    resp1 = Nokogiri::XML(open(url1)).content.gsub(/\n+/, "").gsub(/\s+/, "").gsub(/S1/, "").gsub(/server+/, "").gsub(/router+/, "").gsub(/link+/, "").gsub(/servidor+/, "").gsub(/enlace+/, "").gsub(/,+/, ".").to_f
    resp2 = Nokogiri::XML(open(url2)).content.gsub(/\n+/, "").gsub(/\s+/, "").gsub(/E1/, "").gsub(/server+/, "").gsub(/router+/, "").gsub(/link+/, "").gsub(/servidor+/, "").gsub(/enlace+/, "").gsub(/,+/, ".").to_f
    resp3 = Nokogiri::XML(open(url3)).content.gsub(/\n+/, "").gsub(/\s+/, "").gsub(/R1/, "").gsub(/server+/, "").gsub(/router+/, "").gsub(/link+/, "").gsub(/servidor+/, "").gsub(/enlace+/, "").gsub(/,+/, ".").to_f

    @result = "#{resp1} * #{resp2} * #{resp3} = #{resp1*resp2*resp3}"

    if resp1*resp2*resp3 >= 1
      @msg = "Los servicios estan disponibles!"
    else
      @msg = "Es probable que los servicios no esten disponibles!"
    end

  end

end
