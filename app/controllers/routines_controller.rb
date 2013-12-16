class RoutinesController < ApplicationController
  before_action :set_routine, only: [:show, :edit, :update, :destroy, :PDFFormat]

  # GET /routines
  # GET /routines.json
  def index
    @routines = Routine.all
  end

  # GET /routines/1
  # GET /routines/1.json
  def show
  end

  # GET /routines/new
  def new
    @routine = Routine.new
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines
  # POST /routines.json
  def create
    @routine = Routine.new(routine_params)

    respond_to do |format|
      if @routine.save
        format.html { redirect_to @routine, notice: 'Routine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @routine }
      else
        format.html { render action: 'new' }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routines/1
  # PATCH/PUT /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to @routine, notice: 'Routine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1
  # DELETE /routines/1.json
  def destroy
    @routine.destroy
    respond_to do |format|
      format.html { redirect_to routines_url }
      format.json { head :no_content }
    end
  end
  
  
  
  def PDFFormat
    pdf = Prawn::Document.new
    
    pdf.stroke_rectangle [-10, 730], 560, 44
    pdf.move_down 6
    pdf.font "Helvetica", :size => 18, :style => :bold
    pdf.text "Nombre del alumno"
    
    pdf.font "Helvetica", :size => 12
    pdf.move_down 38
    pdf.font "Helvetica", :style => :bold
    pdf.text "Ejercicio 1: "
    pdf.font "Helvetica", :style => :normal
    pdf.text @routine.ejercicio1
    pdf.move_down 16
    pdf.font "Helvetica", :style => :bold
    pdf.text "Ejercicio 2: "
    pdf.font "Helvetica", :style => :normal
    pdf.text @routine.ejercicio2
    pdf.move_down 16
    pdf.font "Helvetica", :style => :bold
    pdf.text "Ejercicio 3 "
    pdf.font "Helvetica", :style => :normal
    pdf.text @routine.ejercicio3
    
    send_data pdf.render, type: "application/pdf", disposition: "inline"
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def routine_params
      params.require(:routine).permit(:ejercicio1, :ejercicio2, :ejercicio3)
    end
end
