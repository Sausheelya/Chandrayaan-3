# app/controllers/api/spacecrafts_controller.rb

module Api
  class SpacecraftsController < ApplicationController
  	skip_before_action :verify_authenticity_token, only: [:simulate]

    def simulate
      spacecraft = Spacecraft.new(x: 0, y: 0, z: 0, direction: 'N')
      commands = params[:commands]
      spacecraft.execute_commands(commands) if commands.present?

      render json: {
        position: spacecraft.coordinates,
        direction: spacecraft.direction
      }
    end
  end
end
