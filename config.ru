require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  current_domain = ENV['CURRENT_DOMAIN']
  redirect = req.url.gsub(".#{current_domain}", '')

  if current_domain.nil? or current_domain.empty?
    ['200', {'Content-Type' => 'text/html'}, ['Environment variable CURRENT_DOMAIN is not set.']]
  elsif redirect == req.url
    ['200', {'Content-Type' => 'text/html'}, ['No subdomain provided or CURRENT_DOMAIN is set wrong.']]
  else
    ['302', {'Location' => redirect}, []]
  end
end

run app
