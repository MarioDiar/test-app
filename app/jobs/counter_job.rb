class CounterJob < ApplicationJob

  queue_as :default

  def perform(*args)
    puts "Resque job: performing."
    count = Count.first()

    if count.nil?
      count = Count.create(count: 1)
    else
      count.count += 1
      count.save
    end
    puts "Resque job: done."
  end
end
