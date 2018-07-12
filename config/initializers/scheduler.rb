require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '48 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '49 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '50 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '51 10 * * *' do
  User::user_profile_incomplete
end
