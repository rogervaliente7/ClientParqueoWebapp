class CreateReservas < ActiveRecord::Migration[6.1]
  def change
    create_table :reservas do |t|

      t.timestamps
    end
  end
end
