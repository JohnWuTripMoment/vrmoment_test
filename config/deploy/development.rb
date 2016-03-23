set :deploy_to, '/home/apps/vrmoment_test'
set :rails_env, 'development'
set :branch, 'master'
# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

# ip = "52.37.215.12"

role :app, %w{apps@52.196.36.12}
role :web, %w{apps@52.196.36.12}
role :db, %w{apps@52.196.36.12}