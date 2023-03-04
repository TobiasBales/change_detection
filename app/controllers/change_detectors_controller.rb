class ChangeDetectorsController < ApplicationController
  before_action :set_change_detector, only: %i[ show edit update destroy ]

  # GET /change_detectors or /change_detectors.json
  def index
    @change_detectors = ChangeDetector.all
  end

  # GET /change_detectors/1 or /change_detectors/1.json
  def show
  end

  # GET /change_detectors/new
  def new
    @change_detector = ChangeDetector.new
  end

  # GET /change_detectors/1/edit
  def edit
  end

  # POST /change_detectors or /change_detectors.json
  def create
    @change_detector = ChangeDetector.new(change_detector_params)

    respond_to do |format|
      if @change_detector.save
        format.html { redirect_to change_detector_url(@change_detector), notice: "Change detector was successfully created." }
        format.json { render :show, status: :created, location: @change_detector }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @change_detector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /change_detectors/1 or /change_detectors/1.json
  def update
    respond_to do |format|
      if @change_detector.update(change_detector_params)
        format.html { redirect_to change_detector_url(@change_detector), notice: "Change detector was successfully updated." }
        format.json { render :show, status: :ok, location: @change_detector }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @change_detector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_detectors/1 or /change_detectors/1.json
  def destroy
    @change_detector.destroy

    respond_to do |format|
      format.html { redirect_to change_detectors_url, notice: "Change detector was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change_detector
      @change_detector = ChangeDetector.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def change_detector_params
      params.require(:change_detector).permit(:url)
    end
end
