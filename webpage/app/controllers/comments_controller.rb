class CommentsController < ApplicationController
	#http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
	before_action :set_comment, only: [:update, :destroy]
	before_action :set_article
	before_action :authenticate_user!

	 def create
	    @comment = current_user.comments.new(comment_params)
	    # El articulo al que pertenece este comentario es el de la URL.
	    @comment.article = @article
	    respond_to do |format|
	      if @comment.save
	        format.html { redirect_to @comment.article, notice: 'Comment was successfully created.' }
	        format.json { render :show, status: :created, location: @comment.article }
	      else
	        format.html { render :new }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	    end
  	end

	def show		
	end

	def new
		@comment = Comment.new
	end

	def edit
	end

	def destroy
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
		
	end

	def index
		#todos los comentarios
		@comments = Comment.all
	end

	def update
	    respond_to do |format|
	      if @comment.update(comment_params)
	        format.html { redirect_to @comment.article, notice: 'Comment was successfully updated.' }
	        format.json { render :show, status: :ok, location: @comment.article }
	      else
	        format.html { render :edit }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def destroy
	    @comment.destroy
	    respond_to do |format|
	      format.html { redirect_to @article, notice: 'Comment was successfully destroyed.' }
	      #format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end


	private
		def set_article
			@article = Article.find(params[:article_id])
		end
		def set_comment
			@comment = comment.find(params[:id])
		end

		def comment_params
			params.require(:comment).permit(:user_id, :article_id, :body)
			
		end
end
