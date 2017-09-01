class AddDetalleToEmpresas < ActiveRecord::Migration[5.0]
  def change
    add_column :empresas, :descripcion, :text
  end
end
