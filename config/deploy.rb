require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "MarketingWeb" # The name of your app
set :deploy_to, "/home/ubuntu/apps/MarketingWeb" # The directory on the EC2 node that will be deployed to
set :user, 'ubuntu'
set :domain, 'www.fleetnext.com'
ssh_options[:forward_agent] = true
set :keep_releases, 3
set :use_sudo, false
ssh_options[:keys] = ["/home/chintdo/.ec2/b310ubuntu.pem"]
default_run_options[:pty] = true

role :web, "www.fleetnext.com"                         # Your HTTP server, Apache/etc
role :app, "www.fleetnext.com"                           # This may be the same as your `Web` server
role :db,  "www.fleetnext.com" , :primary => true

set :scm, :git
set :repository,  "git@github.com:fleetapp/MarketingWeb.git"
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

set :rvm_ruby_string, 'ruby-1.9.3-p194@MarketingWeb' # you probably have this already
set :rvm_type, :user # this is the money config, it defaults to :system

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
#after 'deploy:update_code', 'deploy:symlink_db'
before 'bundle:install', 'deploy:symlink_db'

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   
   desc "Symlinks the database.yml "
   task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
   end

 end


