require 'net/http'

http = Net::HTTP.new('18.235.214.57', 3001)
request = Net::HTTP::Get.new('/api/v1/topics')
response = http.request(request)
topics = JSON.parse(response.body)
$temas = []
topics["topics"].each do |topic|
  $temas.append(topic["name"])
end

class Preguntum < ApplicationRecord
    validates_inclusion_of :tema, in: $temas
end
