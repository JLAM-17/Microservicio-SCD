require 'net/http'
$temas = []

http = Net::HTTP.new('18.235.214.57', 3001)
http.open_timeout = 5 # Set the open timeout to 5 seconds
http.read_timeout = 5 # Set the read timeout to 10 seconds

begin
  request = Net::HTTP::Get.new('/api/v1/topics')
  response = http.request(request)
  topics = JSON.parse(response.body)
  topics["topics"].each do |topic|
    $temas.append(topic["name"])
  end
rescue Net::ReadTimeout, Net::OpenTimeout => e
  print("Ocurrio un error de Timeout: #{e.message}")
  $temas = ["Ciencia de Datos", "CiberSeguridad"]
rescue => e
  print ("Ha ocurrido un error: #{e.message}")
  $temas = ["Ciencia de Datos", "CiberSeguridad"]
end





class Preguntum < ApplicationRecord
    validates_inclusion_of :tema, in: $temas
end
