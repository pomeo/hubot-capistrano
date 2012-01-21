load 'deploy' if respond_to?(:namespace)
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

#========================
#CONFIG
#========================
set :application, "example"
#========================
#GIT
#========================
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :scm, :git
set :scm_username, "pomeo"
set :scm_passphrase, "p@ssw0rd"
set :repository,  "git@github.com:pomeo/hubot-capistrano.git"
set :branch, "master"
set :git_enable_submodules, 1
#========================
#DEPLOY
#========================
set :user, "user"
set :password, "password"
set :use_sudo, false
set :deploy_to, "/var/www/"
#========================
#ROLES
#========================
role :web, "127.0.0.1"
