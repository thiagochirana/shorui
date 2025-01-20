namespace :shorui do
  desc "Generate README.md from routes"
  task :generate => :environment do
    Shorui::Generator.generate_readme(false)
  end

  desc "Generate README.md excluding Rails routes"
  task :'generate:no_rails_routes' => :environment do
    Shorui::Generator.generate_readme(true)
  end
end