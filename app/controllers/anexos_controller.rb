class AnexosController < ApplicationController

  before_action :require_logged_in_user

def index
  @anexos = Anexo.order(id: :desc)
end

def upload_anexo
    @anexo = Anexo.new
    @anexo.diretorio_anexo = "#{Rails.root}/anexos/#{Time.now.strftime("%d%m%Y%H%M%S%6N")}"
    Anexo.upload_anexo(params[:anexo], @anexo.diretorio_anexo)
    @anexo.save

    redirect_to action: :index
end

def download_anexo
    Anexo.download_anexo(params[:diretorio])
    send_file params[:diretorio]+'.zip'
  end

end
