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
]
category = [
  "北京",
  "上海",
  "纽约",
  "东京",
  "杭州",
]

company_name = [
"在做每件事儿的时候，判断工作结果和工作质量，有两个标准： 是否对得起拿到手里的薪水？ 是否对得起自己的时间和精力？",
"当我们学习了某个概念之后，不妨多问问自己： 这个概念还能用在什么领域？ 你多半都会有意外收获。",
"定投策略：定期等额购买某一支（或几只）成长型股票。",
"而在学习和工作这两件事情上，最重要的一个属性就是： 只要你付出了，就一定会有回报。 也就是说，这是两件“输了不会全部折损”的事情。",
"你要追求的是 “至少长期年化复合增长 15 % 的目标”。",
"整个思考过程，背后只有一个方法论： 不断地问自己“最重要的是什么？”  主动思考、主动修正；  一旦找到“最重要的那个东西”，就开始拼命琢磨它……  过程中，依然不断重复以上过程，也许“最重要的是什么”的答案会发生变化……",
"你要做的事情是，用自己的知识，用自己的思考，然后用自己的资本“负责任”地进行投资。负什么责任啊？在浮亏的时候淡定，在浮盈的时候从容，这说起来容易做起来难——因为大多数人并没有合格的知识与判断能力在那资金背后做支撑。",
"从今天开始，认真对待自己的积蓄罢。别只盯着那数字，要学会用比例思考，要学会关注差异。",
"1.安全第一； 而后才是下一条原则： 2.成为专家； 锤炼自己的学习能力，需要什么就学习什么，成为那个领域的专家，然后像专家一样思考、决策、行动。3.看傻瓜们冒险。",
"一个维度分为“正确的”和“错误的”，另一个维度分为“困难的”和“容易的”。  我们的选择标准应该落在第一个维度，而不是第二个维度。",
]


create_jos = for i in 1..10 do
  Job.create!([
    title: jobs[rand(jobs.length)],
    # title: "JOB.no#{i}",
    description: "这是用种子建立的第 #{i} 个Public概念",
    wage_upper_bound: rand(50..99)*100 + 5000,
    wage_lower_bound: rand(10..49)*100 + 5000,
    contact_email: '4@4.com',
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
    contact_email: '4@4.com',
    is_hidden: "true",
    category_id: category[rand(category.length)]
  ])
end
puts "10 Hidden jobs created."
