require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "debe poder crear un post" do
  	post = Post.create(contenido: "Mi contenido",title: "Titulo" )
  	assert post.save 
  end

 # test "debe actualizar un post" do
  #	post = posts(:primer_articulo)
  #	assert post.update(title: "nuevo Titulo", contenido: "nuevo contenido")
  #end

end
