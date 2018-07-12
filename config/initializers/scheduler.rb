require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '18 11 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '19 11 * * *' do
  User::user_profile_incomplete
end
