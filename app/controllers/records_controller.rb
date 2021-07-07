class RecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :setitem, only: :index
  before_action :move_to_index, only: :index
  
  def index
    @item = Item.find(params[:item_id])
    @record_send = RecordSend.new
  end

  def create

    @item = Item.find(params[:item_id])
    @record_send = RecordSend.new(record_params)
    if @record_send.valid?
      Payjp.api_key = "sk_test_b124eefb62fb443244fc9471"  
      Payjp::Charge.create(
        amount: @item[:price],
        card: record_params[:token],
        currency: 'jpy'
      )
      
      @record_send.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


private

def record_params
  params.require(:record_send).permit(:postal_code, :area_id,:municipality, :address, :building, :phone).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
end


def setitem
  @item = Item.find(params[:item_id])
end


 def move_to_index
  if @item.user == current_user
  redirect_to root_path
  end
 end
end