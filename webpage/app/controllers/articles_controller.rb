class ArticlesController < ApplicationController
	#http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	before_action :authenticate_user!, except: [:show, :index]#necesitara ser usuario para poder crear, modificar, eliminar un articulo, solo podran verlo
	before_action :set_article, except: [:index, :new, :create]#eliminar codigo repetido, las demas acciones tenian codigo en comun y hemos creado set_article con ese codigo repetido
	def new
		@article = Article.new
	end

	def create
		@article = current_user.articles.new(article_params)

		if @article.save
			redirect_to @article#ver el articulo guardado
		else
			render 'new'
		end
	end

	def show
		#encontrar un registro por id (id que por defecto se crea al hacer las migraciones)
	end

	def index
		#todos los articulos
		@articles = Article.all
	end

	def edit
	end

	def update

		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	def destroy
		@article.destroy

		redirect_to articles_path
	end
		

	private

		def set_article

			@article = Article.find(params[:id])

		end
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
