class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :extension
      t.references :post, index: true

      t.timestamps
    end
  end
end
