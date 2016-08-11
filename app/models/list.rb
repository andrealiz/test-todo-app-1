class List < ApplicationRecord
  has_many :tasks

  def complete_all_tasks!
    tasks.update.all(complete: true)
  end

  def snooze_all_tasks!
  #  tasks.each do |task|
   #   task.snooze_hour!
    #end
    tasks.each {|task| task.snooze_hour!}
  end

  def total_duration
    task.inject(0) { |sum, task| sum + task.duration }
    return total
  end

  def incomplete_tasks
    tasks.reject { |task| task.complete }
  end

  def favorite_tasks
    tasks.select { |task| task.favorite }
  end
  
end