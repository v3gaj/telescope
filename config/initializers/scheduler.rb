require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '10s' do
  User::user_profile_incomplete
end