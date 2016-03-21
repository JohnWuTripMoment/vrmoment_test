namespace :dev do

  desc "Rebuild from schema.rb"
  task :build => ["tmp:clear", "log:clear", "dev:kill_pg", "db:drop", "db:create", "db:schema:load", "db:seed", "dev:fake"]

  # desc "Rebuild from migrations"
  # task :rebuild => ["tmp:clear", "log:clear", "dev:kill_pg", "db:drop", "db:create", "db:migrate", "db:seed", "dev:fake"]

  # desc "generate fake data for development"
  # task :fake => :environment do
  # end

  task :kill_pg do
    config = YAML::load(File.open('config/database.yml'))['development']
  end

end
