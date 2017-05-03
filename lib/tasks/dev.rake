namespace :dev do
desc "Rebuild system"
task :build => ["tmp:clear", "log:clear","db:drop","db:creat","db:migrate"]
task :rebuild =>["dev:build", "db:seed"]
end
