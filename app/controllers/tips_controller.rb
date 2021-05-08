class TipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_tip, only: [:show, :edit, :update, :destroy]
  before_action :user_redirect, only: [:edit, :update, :destroy]
  before_action :search_tip, only: [:index, :search, :detail_search]

  def index
    @tips = Tip.order(updated_at: :DESC)
  end

  def new
    @tip = TipTag.new
  end

  def create
    @tip = TipTag.new(tip_params)
    tag_list = params[:tip][:name].split(',')
    if @tip.valid?
      @tip.save(tag_list)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @tip.comments.includes(:user).sort_by { |columun| columun.updated_at }.reverse
  end

  def edit
    @form = TipTag.new(tip: @tip)
  end

  def update
    @form = TipTag.new(tip_params, tip: @tip)
    tag_list = params[:tip][:name].split(',')
    if @form.valid?
      @form.save(tag_list)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @tip.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @tips = Tip.search(params[:keyword])
  end

  def detail_search
    @results = @t.result.includes(:user, :tip_tag_relations).order(updated_at: :DESC)
  end

  def tagsearch
    return nil if params[:keyword] == ''

    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  private

  def tip_params
    params.require(:tip).permit(:title, :category_id, :description, :image, :name, :id, :_method, :authenticity_token, :commit,
                                :tip).merge(user_id: current_user.id)
  end

  def set_tip
    @tip = Tip.find(params[:id])
  end

  def user_redirect
    redirect_to action: :index unless current_user.id == @tip.user.id
  end

  def search_tip
    @t = Tip.ransack(params[:q])
    @category = Category.where.not(id: 1)
  end
end
