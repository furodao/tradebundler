lock '3.5.0'

set :application, 'salesapp'

set :repo_url, 'https://eric-khoury:gK41K49o80e89@github.com/eric-khoury/salesapp.git'

set :branch, "master"
set :scm, :git

set :deploy_to, '/home/rails/salesapp'
set :rails_env, "production"
set :ssh_options, {forward_agent: true}

set :pty, false
set :keep_releases, 5

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :default_run_options, { pty: true }
set :ssh_options, { forward_agent: true, paranoid: true, keys: "~/.ssh/id_rsa" }

set :log_level, :debug

namespace :deploy do

  desc 'Restart application'

	task :start, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      cd /home/rails/salesapp/current && unicorn -c unicorn.rb -E production -D
    CMD
	end

  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

	#after "bundle:install" do
	#	run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
	#end

end
