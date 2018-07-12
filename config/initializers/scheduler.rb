require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '15 12 * * *' do
  User::user_profile_incomplete
end

scheduler.cron '16 12 * * *' do
  User::user_profile_incomplete
end
