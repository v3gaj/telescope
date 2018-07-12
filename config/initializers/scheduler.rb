require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '56 9 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '57 9 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '58 9 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '59 9 * * *' do
  User::user_profile_incomplete
end
