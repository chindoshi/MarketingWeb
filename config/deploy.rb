require 'bundler/capistrano'
require "rvm/capistrano"   

set :application, "MarketingWeb" # The name of your app
set :deploy_to, "/var/www/apps/MarketingWeb" # The directory on the EC2 node that will be deployed to
set :user, 'ubuntu'
set :domain, 'www.fleetnext.com'
ssh_options[:forward_agent] = true
set :keep_releases, 3
set :use_sudo, false
ssh_options[:keys] = ["/home/chintdo/.ec2/b310ubuntu.pem"]



role :web, :domain                         # Your HTTP server, Apache/etc
role :app, :domain                           # This may be the same as your `Web` server
role :db,  :domain , :primary => true

set :scm, :git
set :repository,  "git@github.com:fleetapp/MarketingWeb.git"
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

set :rvm_ruby_string, 'ruby-1.9.3-p194@MarketingWeb' # you probably have this already
set :rvm_type, :user # this is the money config, it defaults to :system

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end


