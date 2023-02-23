class FeaturesController < ApplicationController
  layout 'packs'
  before_action :set_feature, only: %i[update edit]
  before_action :set_pack, only: %i[new create update edit]

  def index
    @features = Feature.all
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(feature_params)

    if @feature.save
      redirect_to pack_features_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @feature.update(feature_params)
      redirect_to pack_features_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_pack
    @pack = Pack.find(params[:pack_id])
  end

  def set_feature
    @feature = Feature.find(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:pack_id, :status_id, :description, :cost, :delivery_date)
  end
end
