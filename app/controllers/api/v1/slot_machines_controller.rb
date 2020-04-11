# frozen_string_literal: true

module Api
  module V1
    # The controller for slot machines.
    class SlotMachinesController < ApplicationController
      def index
        render json: SlotMachine.all
      end

      def spin
        bet = params[:bet].to_i # will be given by params
        user = User.all.sample  # sample user
        no_bet = false          # if no bet was provided

        # Invalid bet
        if bet <= 0 || no_bet
          return render json:
            {
              status: 400,
              error: {
                message: 'Invalid bet: bet must be greater than 0.'
              }
            }
        end

        # Affords
        if user.decrement(:balance, bet).save
          slot_machine = SlotMachine.find(params[:id])
          render json: {
            status: 200,
            matrix: slot_machine.random_grid,
            balance: user.balance,
            payout: 1000
          }

        # Does not afford
        else
          render json: {
            status: 400,
            error: {
              message: "Insufficient funds: you can't afford playing this. Poor person. lol"
            }
          }
        end
      end
    end
  end
end
