require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '58 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '59 10 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '00 11 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '01 11 * * *' do
  User::user_profile_incomplete
end
