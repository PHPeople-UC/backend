class Api::V1::PropertiesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    properties = if params[:commune].present?
                   Property.where(commune: [params[:commune].split(",")])
                 else
                   Property.all
                 end
    respond_with paginate(filtered_collection(properties)), deep: params[:deep].present?
  end

  def show
    respond_with property, deep: params[:deep].present?
  end

  def create
    respond_with current_user.properties.create!(property_params)
  end

  def update
    respond_with property.update!(property_params), deep: params[:deep].present?
  end

  def destroy
    respond_with property.destroy!
  end

  private

  def property
    @property ||= Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(
      :name,
      :commune,
      :description,
      :active,
      :price,
      :price_unit,
      :size,
      :size_unit,
      :address
    )
  end
end
