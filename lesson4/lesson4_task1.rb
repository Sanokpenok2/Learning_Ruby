def index(path)
  file = File.read(path)
  puts file
end

def find(path, id)
  line_with_id = "No line with id #{id}"
  File.foreach(path).with_index do |line, line_id|
    line_with_id = line if id == line_id
  end

  return line_with_id
end

def where(path, pattern)
  lines_with_pattern = []

  File.foreach(path) do |line|
    lines_with_pattern << line if line.include?(pattern)
  end

  return (lines_with_pattern.empty?? nil : lines_with_pattern)
end

def update(path, id, text)
  buffer = "buffer.txt"

  File.foreach(path).with_index do |line, line_id|
    File.write(buffer, (line_id == id)? text : line, mode: 'a')
  end

  File.write(path, File.read(buffer))
  File.delete(buffer) if File.exist?(buffer)
end

def delete(path, id)
  buffer = "buffer.txt"
  File.foreach(path).with_index do |line, line_id|
    File.write(buffer, line, mode: 'a') if id != line_id
  end

  File.write(path, File.read(buffer))
  File.delete(buffer) if File.exist?(buffer)
end

def add(path, text)
  file = File.open(path, 'a')
  file.write("\n" + text + "\n")
  file.close
end

PATH = "Students.txt"
add(PATH, "Никитос")