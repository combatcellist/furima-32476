class ItemsController < ApplicationController
  before_action :authenticate_user!

  def move_to_root_path
    redirect_to action: :edit unless user_signed_in?
  end


  def index
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def create
  end


end
