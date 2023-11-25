class CreateTipoEspacios < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_espacios do |t|

      t.timestamps
    end
  end
end
