# frozen_string_literal: true

module Api
  module V1
    class SlotMachinesController < ApplicationController
      def index
        render json: SlotMachine.all
      end

      def spin
        render json: 10
      end
    end
  end
end
