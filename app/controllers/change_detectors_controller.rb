class ChangeDetectorsController < ApplicationController
  before_action :set_change_detector, only: %i[show edit update destroy]

  def index
    @change_detectors = ChangeDetector.all
  end

  def show; end

  def new
    @change_detector = ChangeDetector.new
  end

  def edit; end

  def create
    @change_detector = ChangeDetector.new(change_detector_params)

    if @change_detector.save
      redirect_to change_detector_url(@change_detector), notice: 'Change detector was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @change_detector.update(change_detector_params)
      redirect_to change_detector_url(@change_detector), notice: 'Change detector was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @change_detector.destroy

    redirect_to change_detectors_url, notice: 'Change detector was successfully destroyed.'
  end

  private

  def set_change_detector
    @change_detector = ChangeDetector.find(params[:id])
  end

  def change_detector_params
    params.require(:change_detector).permit(:url)
  end
end
