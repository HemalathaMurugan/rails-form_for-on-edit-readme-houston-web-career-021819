class PostsController < ApplicationController
	def index
		@posts = Post.all
	end 

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	#	@post = Post.new
	#the above line is changed to have strong params
		@post = Post.new(params.permit(:title, :description))
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		
	  @post = Post.find(params[:id])
		#the below line is changed to make the form_for
		#form_for is bound directly with th epost model--so we need to pass the model name into the udapte method
		#@post.update(title: params[:title], description: params[:description])
		#@post.update(params.require(:post))
		@post.update(params.require(:post).permit(:title))
		#with this change in the update method the title and description attributes are now nested withion the post hash
	  redirect_to post_path(@post)
	end
end