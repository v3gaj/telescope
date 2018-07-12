require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '11 11 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '12 11 * * *' do
  User::user_profile_incomplete
end
