class AddColumnToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :costo, :decimal, precision: 10, scale: 3 #guardaria un numero de 10 digitos y 3 despues del punto
  end
end
