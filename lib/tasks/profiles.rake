namespace :profiles do
  desc "Create blank profiles for users missing them"
  task :backfill => :environment do
    total = User.all.count
    missing_profile = User.all.select { |x| x.profile == nil }
    puts "Total users: #{total}"
    puts "Missing profile: #{missing_profile.count}"

    missing_profile.each do |user|
      puts "* Creating profile for '#{user.email}'"
      Profile.create({user_id: user.id})
    end

    puts "Done"
  end
end
