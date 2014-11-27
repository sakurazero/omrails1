 class PinsController < ApplicationController
  before_filter :authenticate_user!,except: [:index]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.order("created_at desc")
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = current_user.pins.new
    respond_with(@pin)
  end

  def edit
    @pin = current_user.pins.find(params[:id])
  end

  def create
    @pin = current_user.pins.new(pin_params)
    @pin.save
    respond_with(@pin)
  end

  def update
    @pin = current_user.pins.find(params[:id])
    respond_with(@pin)
  end

  def destroy
        @pin = current_user.pins.find(params[:id])
    @pin.destroy 
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description ,:image)
    end

end


#def create
  #@user = User.create( user_params )
#end

#private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

#def user_params
  #params.require(:user).permit(:avatar)
#end