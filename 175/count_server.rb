require 'socket'

def parser(req_line)
  http_method, path_params, http = req_line.split(' ')
  path, params = path_params.split("?")

  params = (params || "").split("&").each_with_object({}) do |query, hsh|
    query_name, value = query.split("=")
    hsh[query_name] = value
  end

  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do 
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  next unless request_line

  http_method, path, params = parser(request_line)

  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The Current Number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Add One</a>"
  client.puts "<a href='?number=#{number - 1}'>Subtract One</a>"

  client.puts "</body>"
  client.puts "</html>"
  
  client.close
end