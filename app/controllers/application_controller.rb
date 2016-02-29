class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :sim_loop_service

  def sim_loop_service
    @sim_loop_service ||= SimLoopService.new
  end
end
