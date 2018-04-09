#https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyBsjiRQtbJtZ1iFYu-ujBtJMcHuj5O6EA4

require 'net/http'
require 'json'

uri = URI('https://maps.googleapis.com/maps/api/geocode/json')
params = { :address => "1250 McIngvale Rd. Hernando, Ms 38632", :key => "AIzaSyBsjiRQtbJtZ1iFYu-ujBtJMcHuj5O6EA4" }
uri.query = URI.encode_www_form(params)

res = Net::HTTP.get_response(uri)
puts res.body if res.is_a?(Net::HTTPSuccess)

puts lat = JSON.parse(res.body)['results'][0]['geometry']['location']['lat']

puts lng = JSON.parse(res.body)['results'][0]['geometry']['location']['lng']
