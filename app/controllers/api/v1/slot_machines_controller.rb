# frozen_string_literal: true

module Api
  module V1
    class SlotMachinesController < ApplicationController
      def index
        render json: SlotMachine.all
      end

      def spin
        slot_machine = SlotMachine.find(params[:id])
        render json: slot_machine.spin
      end
    end
  end
end
