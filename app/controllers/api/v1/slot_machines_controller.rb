# frozen_string_literal: true

module Api
  module V1
    # The controller for slot machines.
    class SlotMachinesController < ApplicationController
      def index
        render json: SlotMachine.all
      end

      def spin
        bet = 10                # will be given by params
        user = User.all.sample  # sample user
        no_bet = false          # if no bet was provided

        return render json: 'Invalid bet.' if bet <= 0 || no_bet

        # This might work if we have a constraint that balance >= 0.
        # TODO: IS this concurrent?
        if user.decrement(:balance, bet).save
          slot_machine = SlotMachine.find(params[:id])
          return render json: slot_machine.random_grid
        end

        render json: 'Insufficient funds.'
      end
    end
  end
end
