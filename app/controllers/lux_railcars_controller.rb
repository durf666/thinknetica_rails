class LuxRailcarsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @railcars = LuxRailcar.all
  end

  def new
    @railcar = LuxRailcar.new
  end

  def show
  end

  def create
    @railcar = LuxRailcar.new(lux_railcar_params)

    if @railcar.save
      redirect_to @railcar, notice: 'Вагон успешно создан.'
    else
      render :new
    end
  end

  def update
    if @railcar.update(lux_railcar_params)
      redirect_to @railcar
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @railcar.destroy
    redirect_to railcars_path
  end
  private

  def lux_railcar_params
    params.require(:lux_railcar).permit(:number, :upper_seats, :lower_seats, :side_upper_seats, :side_lower_seats, :seating_seats, :railcar_type_id, :train_id)
  end

  def set_train
    @railcar = LuxRailcar.find(params[:id])
  end
end
