class AddLogoToEmpresas < ActiveRecord::Migration[5.0]
  def self.up
  	change_table :empresas do |t|
  		t.attachment :logo
 	end
  end

  def self.down
	drop_attached_file :empresas, :logo
  end	
end


