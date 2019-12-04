desc "check the expiration dates of the challenges"
##FUTURE FEATURE ADD WEB MAILER
task :check_expired => :environment do
  puts "checking dates"
  CheckingDates.new.perform
  puts "done."
end