class LinesController < ApplicationController
  before_action :set_line, only: [:show, :update, :destroy]

  # GET /lines
  def index
    @lines = Line.all

    render json: @lines
  end

  # GET /lines/1
  def show
    render json: @line
  end

  # POST /lines
  def create
    @line = Line.new(line_params)

    if @line.save
      render json: @line, status: :created, location: @line
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lines/1
  def update
    if @line.update(line_params)
      render json: @line
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lines/1
  def destroy
    @line.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def line_params
      params.require(:line).permit(:rows, :columns, :bitmap)
    end
end
