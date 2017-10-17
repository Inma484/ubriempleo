module Picturable
	extend ActiveSupport::Concern 
	include do
		after_save :guardar_imagen
	end
  	PATH_ARCHIVOS = File.join Rails.root, "public", "archivos"#IDENTIFICAMOS LA RUTA CON RAILS.ROOT Y CON FILE.JOIN CONCATENAMOS CON LOS DIRECTORIOS PUBLIC Y ARCHIVOS 

  	def archivo=(archivo)
  		unless archivo.blank?
  			@archivo = archivo
  			if self.respond_to?(:name)
  				self.name= archivo.original_filename 
  			end
  			self.extension = archivo.original_filename.split(".").last.downcase #sse toma el nombre de archivo, se parte, a partir del punto y esa parte se pasa a minuscula
  		end
  	end

  	def path_archivo #nos devuelve la ruta para el archivo
  		File.join PATH_ARCHIVOS, "#{self.id}.#{self.extension}"#si el attachment con id 1, el archivo que le subamos se va a llamar 1.extension
  	end

  	def tiene_archivo?
  		File.exists? path_archivo
 	end

  	private
  	def guardar_imagen
  	 	if @archivo
  	 		FileUtils.mkdir_p PATH_ARCHIVOS #creamos un directorio, cuya ruta es PATH_ARCHIVOS
  	 		File.open(path_archivo, "wb") do |f| #abirto con permiso de escritura
  	 			f.write(@archivo.read)
  	 		end
  	 		@archivo = nil
  	 	end
  	end
end