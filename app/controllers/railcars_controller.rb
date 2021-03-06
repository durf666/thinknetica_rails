class RailcarsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @railcars = Railcar.all
  end

  def new
    @railcar = Railcar.new
  end

  def show

  end

  def create
    @railcar = Railcar.new(railcar_params)

    if @railcar.save
      redirect_to @railcar, notice: 'Вагон успешно создан.'
    else
      render :new
    end
  end

  def update
    if @railcar.update(railcar_params)
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

  def railcar_params
    params.require(:railcar).permit(:upper_seat_number, :lower_seat_number, :railcar_type_id, :train_id)
  end

  def set_train
    @railcar = Railcar.find(params[:id])
  end
end
