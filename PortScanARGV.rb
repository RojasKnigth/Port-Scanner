#encoding: utf-8
#!/usr/bin/ruby

info = '''
#Autor:Danny Rojas Reyes
#Fecha:28/07/2016
#Contacto:afarable-1997@hotmail.com
#Descripcion: Escaner de puertos basico'''


require "socket"
require "timeout"


def escaneo ip, puertos
	puertos.each do |p|
	  begin
	    Timeout::timeout(10){TCPSocket.new("#{ip}", p)}
	  rescue
	    puts "#{p}/tcp Cerrado"
	  else
	    puts "#{p}/tcp Abierto"
		end
	end
end

unless ARGV.size <= 1 || ARGV.size > 2 then
	begin
		ip, puertos = escaneo(ARGV[0].to_s, ARGV[1].split(","))
	rescue e
		puts info
	end
else
	puts info
	puts "Uso del Script: ".upcase  + "./#{$0} <Host> <Port>"
	puts "Ej: ./#{$0} 127.0.0.1 21,22,80,445,1433,3389"

end
