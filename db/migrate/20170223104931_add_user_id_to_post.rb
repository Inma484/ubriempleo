class AddUserIdToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :user, foreign_key: true #se añade una referencia en la tabla Post para que referencia a User
  end
end
