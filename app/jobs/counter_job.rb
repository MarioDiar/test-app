class CounterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Resque Job being performed"

    @count = Count.first()

    if @count.nil?
      @count = Count.create(count: 1)
    else
      @count.count += 1
      @count.save
    end

  end
end
