require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '40 8 * * *' do
  User::user_profile_incomplete
end