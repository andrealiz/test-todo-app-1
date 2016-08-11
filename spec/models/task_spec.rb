require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do 
    it 'should switch complete to false if it began as true' do 
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete to true if it began as false' do 
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe '#toggle_favorite!' do 
    it 'should switch favorite to false if it began as true' do 
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
      end

    it 'should switch favorite to true if it began as false' do 
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do 
    it 'should return true if deadline is earlier than now' do 

      time = Time.new(deadline: 1.day.ago)
      time.overdue?
      expect(time.overdue?).to eq(true)
    end

    it 'should return false if deadline is later than now' do 
      time = Time.new(deadline: 1.day.from_now)
      time.overdue?
      expect(time.overdue?).to eq(false)
    end
  end

  describe '#snooze_hour!' do
    it 'should move the deadline past one hour' do
      deadline = DateTime.new(2016, 10, 31)
      task = Task.new(deadline: deadline)
      task.snooze_hour!
      expect(task.deadline).to eq(deadline + 1.hour)
    end
  end

  describe '#increment_priority!' do
    it 'should increase the priority point by 1 if less than 10' do
      task = Task.new(priority: 5)
      task.increment_priority!
      expect(task.increment_priority!).to eq(6)
    end
  end
end