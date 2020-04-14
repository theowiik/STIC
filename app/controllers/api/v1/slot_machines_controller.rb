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

            print_grid(grid)

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

      private

      def print_grid(grid)
        puts '------ PREVIEW STARTED ------'

        grid.each do |row|
          row.each do |symbol|
            print symbol.ascii + ' '
          end
          puts ''
        end

        puts '------ PREVIEW ENDED ------'
      end
    end
  end
end
