class CreateTipoReservas < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_reservas do |t|

      t.timestamps
    end
  end
end
