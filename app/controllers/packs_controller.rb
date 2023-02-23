class PacksController < ApplicationController
  layout 'packs'
  before_action :set_pack, only: %i[show edit update]
  def index
    @packs = Pack.all
  end

  def new
    @pack = Pack.new
    @types = Type.all
  end

  def create
    @pack = Pack.new(pack_params)
    if @pack.save
      redirect_to @pack
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @pack = Pack.find(params[:id])
  end

  def edit; end

  def update
    if @pack.update(packs_params)
      redirect_to @pack
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_pack
    @pack = Pack.find(params[:id])
  end

  def pack_params
    params.require(:pack).permit(:type_id, :client_id, :remaining_hours, :is_valid)
  end
end
