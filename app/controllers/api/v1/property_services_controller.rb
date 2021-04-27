class Api::V1::PropertyServicesController < Api::V1::BaseController
  def index
    respond_with paginate(filtered_collection(PropertyService.all))
  end

  def show
    respond_with property_service
  end

  def create
    respond_with PropertyService.create!(property_service_params)
  end

  def update
    respond_with property_service.update!(property_service_params)
  end

  def destroy
    respond_with property_service.destroy!
  end

  private

  def property_service
    @property_service ||= PropertyService.find(params[:id])
  end

  def property_service_params
    params.require(:property_service).permit(
      :name,
      :description,
      :property_id
    )
  end
end
