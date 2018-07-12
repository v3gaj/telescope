require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '46 8 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '47 8 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '48 8 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '49 8 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '50 8 * * *' do
  User::user_profile_incomplete
end