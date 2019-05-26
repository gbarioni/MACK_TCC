class Anexo < ApplicationRecord

	def self.upload_anexo(anexo, diretorio)
	  FileUtils.mkdir(diretorio) unless File.exists?(diretorio)
	  anexo.each do |anexo|
	  	File.open(File.join(diretorio, anexo.original_filename), "wb") { |f| f.write(anexo.read) }
	  end
	end

	def self.download_anexo(diretorio)
		Zip::File.open(diretorio+'.zip', Zip::File::CREATE) do |anexo_zip|
      Dir.chdir diretorio
      Dir.glob("**/*").reject { |e| File.directory?(e) }.each do |anexo|
        puts "Adicionando #{anexo}"
        anexo_zip.add(anexo.sub(diretorio + '/', ''), anexo)
      end
		end
  end
end
