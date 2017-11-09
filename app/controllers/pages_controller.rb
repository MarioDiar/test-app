class PagesController < ApplicationController
  def home
    CounterJob.perform_later
    @visits = Count.first().nil? ? 0 : Count.first().count
  end
end
