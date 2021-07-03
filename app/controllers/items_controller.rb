class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit, :update]
  before_action :setitem, only: [:show, :edit,:update]
  before_action :move_to_index, only: [:edit,:update]

def index
  @items = Item.all.order("created_at DESC")
end

def new
 @item = Item.new
  
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end
# chatappを参考に

def show
  # @item = Item.find(params[:id])
  
end


def edit
  # @item = Item.find(params[:id])
end

def update
  # item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to root_path
  else
    render :edit
  end

end

def destroy
  item = Item.find(params[:id])
  item.destroy
  redirect_to root_path
end



private

  def item_params
    params.require(:item).permit(:content, :image, :item_name, :description, :price, :user, :category_id, :status_id, :delibery_id, :area_id, :guideline_id).merge(user_id: current_user.id)
  end

  def setitem
    @item = Item.find(params[:id])
  end
  
  def move_to_index
  if @item.user != current_user
   redirect_to root_path
  end
end
end
