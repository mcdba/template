# sample template
if yes?("Use Git?")
  git :init
  run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
  file '.gitignore', <<-END
  .DS_Store
  log/*.log
  tmp/**/*
  config/database.yml
  db/*.sqlite3
  END
  git :add=>".", :commit=>"Initial commit"
end

if yes?("Nifty layout?")
  generate :nifty_layout
end
if yes?("Use Prawn (pdf)?")
  gem "prawn"
  plugin "prawnto", :git => "git://github.com/thorny-sun/prawnto.git"
end
  
rake "gems:install"