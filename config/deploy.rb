lock '3.5.0'

set :application, 'salesapp'

set :repo_url, 'https://eric-khoury:gK41K49o80e89@github.com/eric-khoury/salesapp.git'

set :branch, "master"
set :scm, :git

set :deploy_to, '/home/rails/salesapp'
set :rails_env, "production"
set :ssh_options, {forward_agent: true}

set :unicorn_conf, "#{deploy_to}/current/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/tmp/pids/unicorn.pid"

set :pty, false
set :keep_releases, 5

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :default_run_options, { pty: true }
set :ssh_options, { forward_agent: true, paranoid: true, keys: "~/.ssh/id_rsa" }

set :log_level, :debug


namespace :deploy do

  desc 'Restart application'

  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
			#run "if [ -f /home/rails/salesapp/shared/tmp/pids/unicorn.pid ] && [ -e /proc/$(cat /home/rails/salesapp/shared/tmp/pids/unicorn.pid) ]; then kill -USR2 `cat /home/rails/salesapp/shared/tmp/pids/unicorn.pid`; else cd /home/rails/salesapp/current && bundle exec unicorn -c /home/rails/salesapp/current/unicorn.rb -E production -D; fi"
    end
  end

	task :start do
		#run "bundle exec unicorn -c unicorn.rb -E production -D"
	end

	task :stop do
		#run "if [ -f /home/rails/salesapp/shared/tmp/pids/unicorn.pid ] && [ -e /proc/$(cat /home/rails/salesapp/shared/tmp/pids/unicorn.pid) ]; then kill -QUIT `cat /home/rails/salesapp/shared/tmp/pids/unicorn.pid`; fi"
	end

  after :publishing, :restart

  after :restart, :clear_cache do
    run "if [ -f /home/rails/salesapp/shared/tmp/pids/unicorn.pid ] && [ -e /proc/$(cat /home/rails/salesapp/shared/tmp/pids/unicorn.pid) ]; then kill -USR2 `cat /home/rails/salesapp/shared/tmp/pids/unicorn.pid`; else cd /home/rails/salesapp/current && bundle exec unicorn -c /home/rails/salesapp/current/unicorn.rb -E production -D; fi"
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      #run "cd #{release_path}; RAILS_ENV=production bundle exec unicorn -c unicorn.rb -E production -D"
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
