require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '22 12 * * thu' do
  User::user_profile_incomplete
end
