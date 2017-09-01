class CreateCurriculums < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums do |t|
      t.string :name
      t.string :apellido_1
      t.string :apellido_2
      t.string :direccion
      t.string :phone
      t.string :email
      t.date :fecha_nac
      t.string :cargo1
      t.string :cargo2
      t.string :cargo3
      t.text :datos_i
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
