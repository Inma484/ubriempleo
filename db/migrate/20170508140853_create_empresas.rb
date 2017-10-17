class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :name
      t.string :direccion
      t.string :email
      t.string :web
      t.string :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
