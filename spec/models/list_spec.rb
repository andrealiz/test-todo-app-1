require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do 
    it 'should mark all tasks from the list as complete' do 
      list = List.create(name: "To Do")
      Task.create(complete: false, list_id: list.id, name: "Eat a cookie")
      Task.create(complete: false, list_id: list.id, name: "Drink tea")
      Task.create(complete: false, list_id: list.id, name: "Do some exercise")
      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end

  describe '#snooze_all_tasks!' do 
    it 'should move the deadline past one hour for all tasks' do
      time = Time.new(2016, 05, 10)
      list = List.create(name: "To Do")
      Task.create(deadline: time, list_id: list.id)
      Task.create(deadline: time, list_id: list.id)
      list.snooze_all_tasks!
      list.tasks.each do |task|
        expect(task.deadline).to eq(deadline + 1.hour)
      end
    end
  end

  describe '#total_duration' do
    it 'should give the sum of all tasks of a list' do
      list = List.create(name: "To Do")
      Task.create(duration: 50, list_id: list.id)
      Task.create(duration: 30, list_id: list.id)
      Task.create(duration: 20, list_id: list.id)
        expect(list.total_duration).to eq(200)
    end
  end

  describe '#incomplete_tasks' do
    it 'should mark all tasks from complete to incomplete' do 
      list = List.create(name: "To Do")
      Task.create(complete: true, list_id: list.id, name: "Eat a cookie")
      Task.create(complete: false, list_id: list.id, name: "Drink tea")
      Task.create(complete: false, list_id: list.id, name: "Do some exercise")
      list.incomplete_tasks.each do |task|
        expect(task.complete).to eq(false)
      end
    end
  end
end