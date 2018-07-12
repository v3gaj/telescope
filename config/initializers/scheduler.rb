require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '35 14 * * *' do
  User::user_profile_incomplete
end