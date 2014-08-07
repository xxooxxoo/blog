class ArticlesController < ApplicationController
	before_action  :get_article,only:[:destroy,:update,:edit]
	def index
		@articles=Article.all
	end
	def new 
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to article_path(@article.id)
		end
	end

	def  show
		@article = Article.find(params[:id])
	end
	def  update
		if @article.update(article_params)
		redirect_to articles_path
	end
	end
	def edit
		
	end


	def destroy
		if @article.destroy
			redirect_to articles_path
		end
		
	end

	private

	def article_params
    	params.require(:article).permit(:title,:content)
  	end
  	def get_article
  		@article= Article.find(params[:id])
  		
  	end

end
