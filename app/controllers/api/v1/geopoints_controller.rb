class Api::V1::GeopointsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @geopoints = property.geopoints
    respond_with paginate(filtered_collection(@geopoints))
  end

  def show
    respond_with geopoint
  end

  def create
    respond_with property.geopoints.create!(geopoint_params)
  end

  def update
    respond_with geopoint.update!(geopoint_params)
  end

  def destroy
    respond_with geopoint.destroy!
  end

  private

  def property
    @property ||= Property.find(params[:property_id])
  end

  def geopoint
    @geopoint ||= property.geopoints.find(params[:id])
  end

  def geopoint_params
    params.require(:geopoint).permit(
      :latitude,
      :longitude
    )
  end
end
