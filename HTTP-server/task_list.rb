require "json"

class TaskList
  attr_reader :tasks

  def self.restore_from_json(string)
    data = JSON.load(string)
    tasks = data["tasks"].map {|task| Task.restore_from_data(task)}

    self.new(tasks)
  end

  def initialize(tasks = [])
    @tasks = tasks
  end

  def add_task(text)
    task = Task.new(@tasks.length + 1, text)
    @tasks << task
    task.id
  end

  def toggle_task(id)
    task = @tasks.find {|t| t.id == id}
    task ? task.toggle : nil
  end

  def to_h
    { tasks: @tasks.map{|task| task.to_h} }
  end

  def to_json
    JSON.generate(to_h)
  end
end
