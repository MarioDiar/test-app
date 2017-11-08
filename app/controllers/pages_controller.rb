class PagesController < ApplicationController
  def home
    CounterJob.perform_later(20)
    @count = Count.first()
  end
end
