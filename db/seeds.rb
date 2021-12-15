# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Cycle.destroy_all
GoodHabit.destroy_all
BadHabit.destroy_all

10.times do
  u = User.new(
    name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "azeaze",
    password_confirmation: "azeaze"
  )
  u.save
  u.errors.messages
end

Cycle.create(title: "daily")
Cycle.create(title: "weekly")
Cycle.create(title: "monthly")
Cycle.create(title: "overall")

10.times do
  gh = GoodHabit.new(
    title: Faker::Job.key_skill,
    announced_checkpoints: rand(0..35),
    user: User.all.sample,
    cycle: Cycle.all.sample
  )
  gh.save
  gh.errors.messages
end

10.times do
  bh = BadHabit.new(
    title: Faker::Kpop.iii_groups,
    announced_checkpoints: rand(0..35),
    user: User.all.sample,
    cycle: Cycle.all.sample
  )
  bh.save
  bh.errors.messages
end

puts "%%%%%%%%%%%%%%%%%"
puts "Database filled !"