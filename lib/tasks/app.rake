namespace :app do
  desc "initialize database"

  task init: "db:load_config" do
    ["db:create", "db:migrate", "db:seed"].each do |x|
      Rake::Task[x].invoke
    end
  end

  desc "Reset data(db:drop & db:create & db:migrate & db:testdata & db:seed)"

  task :reset => "db:load_config" do
    ["db:drop", "db:create", "db:migrate", "db:seed"].each do |x|
      Rake::Task[x].invoke
    end
  end
end
