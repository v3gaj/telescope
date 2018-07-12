require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '30 14 * * *' do
  User::user_profile_incomplete
end