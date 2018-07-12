require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '20 12 * * thu' do
  User::user_profile_incomplete
end
