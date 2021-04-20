class Api::V1::GeopointsController < Api::V1::BaseController
  def index
    respond_with paginate(filtered_collection(Geopoint.all))
  end

  def show
    respond_with geopoint
  end

  def create
    respond_with Geopoint.create!(geopoint_params)
  end

  def update
    respond_with geopoint.update!(geopoint_params)
  end

  def destroy
    respond_with geopoint.destroy!
  end

  private

  def geopoint
    @geopoint ||= Geopoint.find_by!(id: params[:id])
  end

  def geopoint_params
    params.require(:geopoint).permit(
      :latitude,
      :longitude,
      :property_id
    )
  end
end
