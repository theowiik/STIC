class SlotMachineSymbolPaytablesController < ApplicationController
  before_action :set_slot_machine_symbol_paytable, only: [:show, :update, :destroy]

  # GET /slot_machine_symbol_paytables
  def index
    @slot_machine_symbol_paytables = SlotMachineSymbolPaytable.all

    render json: @slot_machine_symbol_paytables
  end

  # GET /slot_machine_symbol_paytables/1
  def show
    render json: @slot_machine_symbol_paytable
  end

  # POST /slot_machine_symbol_paytables
  def create
    @slot_machine_symbol_paytable = SlotMachineSymbolPaytable.new(slot_machine_symbol_paytable_params)

    if @slot_machine_symbol_paytable.save
      render json: @slot_machine_symbol_paytable, status: :created, location: @slot_machine_symbol_paytable
    else
      render json: @slot_machine_symbol_paytable.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /slot_machine_symbol_paytables/1
  def update
    if @slot_machine_symbol_paytable.update(slot_machine_symbol_paytable_params)
      render json: @slot_machine_symbol_paytable
    else
      render json: @slot_machine_symbol_paytable.errors, status: :unprocessable_entity
    end
  end

  # DELETE /slot_machine_symbol_paytables/1
  def destroy
    @slot_machine_symbol_paytable.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slot_machine_symbol_paytable
      @slot_machine_symbol_paytable = SlotMachineSymbolPaytable.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def slot_machine_symbol_paytable_params
      params.require(:slot_machine_symbol_paytable).permit(:slot_machine_symbol_id, :occurrences, :pay)
    end
end
