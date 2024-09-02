class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy, :show]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    content = @post.content

    render json: {
      id: @post.id,
      title: @post.title,
      content: {
        id: content.id,
        name: content.name,
        body: content.body,
        record_type: content.record_type,
        record_id: content.record_id,
        created_at: content.created_at,
        updated_at: content.updated_at
      },
      created_at: @post.created_at,
      updated_at: @post.updated_at
    }, status: :ok, location: @post
  rescue ActiveRecord::RecordNotFound
    render json: {
      message: "Post não encontrado."
    }, status: :not_found
  end

  # GET /posts/new
  def new
    @post = Post.new
  end


  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: {
        post: @post,
        message: "Post criado com sucesso!"
      }, status: :created, location: @post
    else
      render json: {
        errors: @post.errors,
        message: "Erro ao criar o post."
      }, status: :unprocessable_entity
    end
  end


  def post_params
    params.require(:post).permit(:title, :content)
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    if @post.update(post_params)
      render json: {
        post: @post,
        message: "Post atualizado com sucesso!"
      }, status: :ok, location: @post
    else
      render json: {
        errors: @post.errors,
        message: "Erro ao atualizar o post."
      }, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    if @post.destroy!
      render json: {
        post: @post,
        message: "Post deletado com sucesso!"
      }, status: :ok, location: @post
    else
      render json: {
        errors: @post.errors,
        message: "Erro ao deletar o post."
      }, status: :unprocessable_entity
    end
  end
end
