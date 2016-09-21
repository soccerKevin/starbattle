class MapController < ApplicationController
  def new
    @map_size = 9
  end

  def show
    @map = Map.find params[:id] rescue return render 'public/404', status: 404
    render json: @map.to_json(include: :squares), status: 200
  end

  def create
    @map = Map.create map_params rescue return render 'public/404', status: 401
    render json: @map, status: 200
  end

  private

  def map_params
    params.require(:map).permit([:width, squares_attributes: [:group_index, :state] ])
  end
end
