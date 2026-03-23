class Storage
  def initialize(path = "./HTTP-server/tasks.json")
    @path = path
  end

  def save(task_list)
    File.open(@path, "w") do |f|
      f.write(JSON.generate(task_list.to_h))
    end
  end

  def load
    data = File.read(@path)
    TaskList.restore_from_json(data)
  end
end
