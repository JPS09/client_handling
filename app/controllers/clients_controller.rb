class ClientsController < ApplicationController
  layout 'packs'
  before_action :set_client, only: %i[edit update]
  def new
    @client = Client.new
  end

  def create
    if @client.save
      redirect_to @client
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to @client
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :address, :phone_number)
  end
end
