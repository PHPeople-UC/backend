class Api::V1::PropertiesController < Api::V1::BaseController
  def index
    respond_with paginate(filtered_collection(Property.all))
  end

  def show
    respond_with property
  end

  def create
    respond_with Property.create!(property_params)
  end

  def update
    respond_with property.update!(property_params)
  end

  def destroy
    respond_with property.destroy!
  end

  private

  def property
    @property ||= Property.find_by!(id: params[:id])
  end

  def property_params
    params.require(:property).permit(
      :name,
      :commune,
      :description
    )
  end
end
