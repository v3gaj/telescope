require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '6 11 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '7 11 * * *' do
  User::user_profile_incomplete
end
