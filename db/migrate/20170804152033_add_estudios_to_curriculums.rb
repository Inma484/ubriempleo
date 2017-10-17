class AddEstudiosToCurriculums < ActiveRecord::Migration[5.0]
  def change
    add_column :curriculums, :estudios1, :string
    add_column :curriculums, :estudios2, :string
  end
end
