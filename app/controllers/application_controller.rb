class ApplicationController < ActionController::API
  def generate_error(status, msg)
    render json: {
      status: status,
      error: {
        message: msg
      }
    }
  end
end
