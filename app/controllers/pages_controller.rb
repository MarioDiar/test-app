class PagesController < ApplicationController

  before_action -> { logger.info request.user_agent }

  def home
    @visits = Count.first().nil? ? 0 : Count.first().count
  end

  def count
    CounterJob.perform_later
    redirect_to root_path
  end

  def status
    render plain: "Ok"
  end
end

