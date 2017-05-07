class ArticlesController < ApplicationController
  before_action :authenticate_author!, :except => [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.order('created_at DESC')
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    set_meta_tags title: @article.title,
            site: 'Pine Blog',
            reverse: true,
            description: @article.body.truncate(300),
            twitter: {
              card: "summary",
              title: @article.title,
              description:  @article.body.truncate(300),
            },
            og: {
              title:    @article.title,
              description: @article.body.truncate(300),
              type:     'website',
              url:      article_url(@article),
            }
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
    unless @article.author == current_author || current_author.present?
      return render text: "Not Allowed", status: :forbidden
  end
end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_author.articles.create(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
        format.js
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :published, :id)
    end
end
