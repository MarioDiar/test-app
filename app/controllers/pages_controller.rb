class PagesController < ApplicationController
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
