# frozen_string_literal: true

module Api
  module V1
    # The controller for slot machines.
    class SlotMachinesController < ApplicationController
      def index
        render json: SlotMachine.all
      end

      def spin
        bet = params[:bet].to_i
        user = User.all.sample

        # Invalid bet
        if bet <= 0
          return generate_error(400, 'Invalid bet: bet must be greater than 0.')
        end

        begin
          if user.decrement(:balance, bet).save
            slot_machine = SlotMachine.find(params[:id])
            grid = slot_machine.random_grid

            render json: {
              status: 200,
              payout: slot_machine.calculate_payout(grid, bet),
              balance: user.balance,
              matrix: grid
            }
          else
            generate_error(
              400,
              'Insufficient funds: you dont have sufficient funds to play this.'
            )
          end
        rescue
          generate_error(500, 'Unkown error.')
        end
      end
    end
  end
end
