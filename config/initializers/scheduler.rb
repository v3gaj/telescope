require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton

scheduler.every '10m' do
  User::user_profile_incomplete
end