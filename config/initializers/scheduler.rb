require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '43 9 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '44 9 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '45 9 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '46 9 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '57 9 * * *' do
  User::user_profile_incomplete
end