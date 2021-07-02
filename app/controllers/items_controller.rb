class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

def index
  # @items = Item.order("created_at DESC")
  @items = Item.all
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

private

  def item_params
    params.require(:item).permit(:content, :image, :item_name, :description, :price, :user, :category_id, :status_id, :delibery_id, :area_id, :guideline_id).merge(user_id: current_user.id)
  end
# pictweetのコントローラーを参考にする

end
