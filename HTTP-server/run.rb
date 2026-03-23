require_relative 'task'
require_relative 'task_list'
require_relative 'storage'

tl = TaskList.new
tl.add_task("Купить продукты")
tl.add_task("Зайти в Озон")
tl.add_task("Помыть посуду")

st = Storage.new("./HTTP-server/tasks.json")
st.save(tl)