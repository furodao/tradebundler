# Set the working application directory
# working_directory "/path/to/your/app"
require 'rack'
working_directory "/home/rails/salesapp/current"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/rails/salesapp/current/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/rails/salesapp/current/log/unicorn.log"
stdout_path "/home/rails/salesapp/current/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.salesapp.sock"
listen "/tmp/unicorn.salesapp.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
