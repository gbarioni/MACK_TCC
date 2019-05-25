class ArquivosController < ApplicationController

  before_action :require_logged_in_user


  def index
    @arquivos = current_user.arquivos
  end

  def new
    @arquivo = Arquivo.new
  end

  def create
    @arquivo = current_user.arquivos.build(arquivo_params)
    if @arquivo.save
      flash[:success] = 'Arquivo criado com sucesso.'
      redirect_to user_arquivos_path
    else
      render 'new'
    end
  end

  def edit
    @arquivo = current_user.arquivos.find_by(id: params[:id])
    if @arquivo.nil?
      flash[:danger] = 'Arquivo não encontrado.'
      redirect_to user_arquivos_path(current_user)
    end
  end

  def update
    @arquivo = current_user.arquivos.find(params[:id])
    if @arquivo.update(arquivo_params)
      flash[:success] = 'Arquivo atualizado com sucesso'
      redirect_to user_arquivos_path
    else
      render 'edit'
    end
  end

  def destroy
    @arquivo = current_user.arquivos.find(params[:id])
    if @arquivo.destroy
      flash[:success] = 'Arquivo removido com sucesso'
      redirect_to user_arquivos_path
    else
      flash[:danger] = 'Arquivo não encontrado.'
      redirect_to user_arquivos_path(current_user)
    end
  end

  private
    def arquivo_params
      params.require(:arquivo).permit(:titulo, :autor, :ano, :licenca)
    end
end
