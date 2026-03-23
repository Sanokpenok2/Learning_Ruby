class Task
  attr_reader :id, :done, :title

  def self.restore_from_data(data)
    id = data["id"]
    title = data["title"]
    done = data["done"] == "true" ? true : false

    self.new(id, title, done)
  end

  def initialize(id, title, done = false)
    @id = id
    @done = done
    @title = title
  end

  def toggle
    @done = !@done
  end

  def to_h
    {
      id: @id,
      title: @title,
      done: @done
    }
  end
end

