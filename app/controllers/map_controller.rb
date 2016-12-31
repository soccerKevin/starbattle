class MapController < ApplicationController
  def new
    @map_size = 9
  end

  def show
    @map = Map.find! params[:id] rescue return render 'public/404', status: 404
    render json: @map.to_json(include: :squares), status: 200
  end

  def show_query
    begin
      @map = Map.find_by! name: params[:name]
    rescue Exception => e
      pp "Map Query Error: ", e
      return render json: e.to_json, status: 404
    end
    render json: @map.to_json(include: :squares), status: 200
  end

  def create
    begin
      @map = Map.create! map_params
    rescue Exception => e
      pp "Map creation error: ", e
      return render json: e.to_json , status: 400
    end
    render json: @map, status: 200
  end

  private

  def map_params
    params.require(:map).permit([:name, :width, squares_attributes: [:group_index, :color] ])
  end
end
