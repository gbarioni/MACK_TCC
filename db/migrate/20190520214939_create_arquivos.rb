class CreateArquivos < ActiveRecord::Migration[5.2]
  def change
    create_table :arquivos do |t|
      t.string :titulo
      t.string :autor
      t.string :ano
      t.string :licenca

      t.timestamps
    end
  end
end
