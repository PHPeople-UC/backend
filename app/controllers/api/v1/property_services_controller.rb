class Api::V1::PropertyServicesController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @services = property.property_services
    respond_with paginate(filtered_collection(@services))
  end

  def show
    respond_with property_service
  end

  def create
    respond_with property.property_services.create!(property_service_params)
  end

  def update
    respond_with property_service.update!(property_service_params)
  end

  def destroy
    respond_with property_service.destroy!
  end

  private

  def property
    @property ||= Property.find(params[:property_id])
  end

  def property_service
    @property_service ||= property.property_services.find(params[:id])
  end

  def property_service_params
    params.require(:property_service).permit(
      :name,
      :description
    )
  end
end
