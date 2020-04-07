# frozen_string_literal: true

module Api
  module V1
    # The controller for slot machines.
    class SlotMachinesController < ApplicationController
      def index
        render json: SlotMachine.all
      end

      def spin
        slot_machine = SlotMachine.find(params[:id])
        render json: slot_machine.random_grid
      end
    end
  end
end
