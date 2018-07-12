require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '9 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '10 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '11 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '12 10 * * *' do
  User::user_profile_incomplete
end
