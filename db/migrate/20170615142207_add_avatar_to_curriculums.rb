class AddAvatarToCurriculums < ActiveRecord::Migration[5.0]
  def self.up 
  	change_table :curriculums do |t|
  		t.attachment :avatar 
  	end
  end

  def self.down
  	drop_attached_file :curriculums, :avatar  	
  end
end
