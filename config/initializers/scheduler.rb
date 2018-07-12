require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new


scheduler.cron '00 10 * * fri' do
  User::user_profile_incomplete
end
