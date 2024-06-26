
class PostsController < ApplicationController
  load_and_authorize_resource except: [:index, :search]

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def new
    @post = Post.new
    # authorize! :new, @post
  end
  

  def search
    @param = params[:search]
    @posts = Post.joins("join action_text_rich_texts as at ON posts.id = at.record_id AND at.record_type = 'Post'")
    .where("title LIKE ? OR at.body LIKE ?", "%#{@param}%", "%#{@param}%")
    .paginate(page: params[:page])
    render 'index'
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post Created successfully"
      redirect_to "/posts"
    else
      flash[:alert] = @post.errors.first.full_message
      redirect_to "/posts/new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      flash[:notice] = "Post Updated successfully"
    else
      flash[:alert] = "Error updating post"
    end
    redirect_to "/posts"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "Post Deleted successfully"
    redirect_to "/"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end