namespace :shorui do
  desc "Generate README.md from routes"
  task generate: :environment do
    Shorui::Generator.generate_readme
  end
end
