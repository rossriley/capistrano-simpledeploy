namespace :deploy do

  desc 'Start a deployment, make sure server(s) ready.'
  task :starting do
  end

  desc 'Update server(s) by setting up a new release.'
  task :updating do
    invoke 'simplegit:deploy'
  end


  desc 'Finish the deployment, clean up server(s).'
  task :finishing do
    invoke 'composer:install'
    invoke 'bundle:build'
  end

  desc 'Finished'
  task :finished do
  end


end

desc 'Deploy a new release.'
task :deploy do
  set(:deploying, true)
  %w{ starting updating finishing finished }.each do |task|
    invoke "deploy:#{task}"
  end
end
task default: :deploy
invoke 'load:defaults'
