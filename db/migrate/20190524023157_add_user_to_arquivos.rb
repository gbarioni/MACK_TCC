class AddUserToArquivos < ActiveRecord::Migration[5.2]
  def change
    add_reference :arquivos, :user, foreign_key: true
    add_reference :anexos, :user, foreign_key: true
  end
end
