class EconomyRailcarsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @railcars = EconomyRailcar.all
  end

  def new
    @railcar = EconomyRailcar.new
  end

  def show

  end

  def create
    @railcar = EconomyRailcar.new(economy_railcar_params)

    if @railcar.save
      redirect_to @railcar, notice: 'Вагон успешно создан.'
    else
      render :new
    end
  end

  def update
    if @railcar.update(economy_railcar_params)
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

  def economy_railcar_params
    params.require(:economy_railcar).permit(:number, :upper_seats, :lower_seats, :side_upper_seats, :side_lower_seats, :seating_seats, :railcar_type_id, :train_id)
  end

  def set_train
    @railcar = EconomyRailcar.find(params[:id])
  end
end

