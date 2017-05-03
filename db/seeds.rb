puts "这个种子档会自动建立一个admin账号，并且创建 10 个public jobs，以及10个hidden jobs"

create_account = User.create([email: '4@4.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "Admin account created."

jobs = [
  "刚需",
  "避险",
  "金钱",
  "投资",
  "预测",
  "全押",
  "定投",
  "长期",
  "倍薪",
  "价格",
  "选择"
]
category = [
  "北京",
  "上海",
  "纽约",
  "东京",
  "杭州"
]


create_jos = for i in 1..10 do
  Job.create!([
    title: jobs[rand(jobs.length)],
    # title: "JOB.no#{i}",
    description: "这是用种子建立的第 #{i} 个Public概念",
    wage_upper_bound: rand(50..99)*100 + 5000,
    wage_lower_bound: rand(10..49)*100 + 5000,
    contact_email: 'raimonfuns@163.com',
    is_hidden: "false",
    category_id: category[rand(category.length)]
  ])
end

puts "10 Public jobs created."

create_jos = for i in 1..10 do
  Job.create!([
    title: jobs[rand(jobs.length)],
    # title: "JOB.no#{i}",
    description: "这是用种子建立的第 #{i+10} 个hidden概念",
    wage_upper_bound: rand(50..99)*100 + 5000,
    wage_lower_bound: rand(10..49)*100 + 5000,
    contact_email: 'raimonfuns@163.com',
    is_hidden: "true",
    category_id: category[rand(category.length)]
  ])
end
puts "10 Hidden jobs created."
