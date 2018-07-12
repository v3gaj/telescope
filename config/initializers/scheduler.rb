require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '40 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '42 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '43 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '44 10 * * *' do
  User::user_profile_incomplete
end
