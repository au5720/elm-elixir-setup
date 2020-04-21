# Get Erlang package
wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb

# Update with the new packages
sudo apt-get update

# Install Erlang
sudo apt-get -y install esl-erlang

# Install elixir
sudo apt-get -y install elixir

# Setup some git settings
git config --global user.email "jennifermorgan2001@gmail.com"
git config --global user.name "Jennifer"

# Install Database
apt-get -y install postgresql
apt-get -y install postgresql-contrib

# Install Node and Npm
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g elm --unsafe-perm=true --allow-root
sudo npm install -g elm-format --unsafe-perm=true --allow-root

# Some tools needed
apt-get -y install inotify-tools
apt install make
apt-get -y install build-essential

#/usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l logfile start


# Package manager for Elixir and Erlang
mix local.hex --force
mix local.rebar --force

# Install Phoenix framework
mix archive.install hex phx_new 1.4.16 --force


# Fix the Postgres password issue
# sudo -u postgres "psql -c \"ALTER USER postgres PASSWORD 'postgres';\" "
# sudo service postgresql restart


# Create the new Phoenix App
# mix phx.new platform
# cd platform
# mix ecto.create
#
# Some Extra Help With Postgres users
# https://stackoverflow.com/questions/35785892/ecto-postgres-install-error-password-authentication-failed


# Heroku Toolkit
# snap install --classic heroku
# heroku login -i
# heroku git:remote -a jens-elixir-platform
# heroku buildpacks:add https://github.com/HashNuke/heroku-buildpack-elixir.git
# heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git

# New files with contents
# touch elixir_buildpack.config
# erlang_version=20.0
# elixir_version=1.7.0
# always_rebuild=true

# touch Procfile
# release: MIX_ENV=prod mix ecto.migrate
# web: MIX_ENV=prod mix phx.server

# heroku addons:create heroku-postgresql:hobby-dev
# heroku config

# mix phx.gen.secret
# heroku config:set SECRET_KEY_BASE=""

# config :platform, PlatformWeb.Endpoint,
#  http: [:inet6, port: System.get_env("PORT") || 4000],
#  url: [scheme: "https", host: "YOUR-HEROKU-APP-NAME.herokuapp.com", port: 443],
#  force_ssl: [rewrite_on: [:x_forwarded_proto]],
#  cache_static_manifest: "priv/static/cache_manifest.json",
#  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Database configuration
# config :platform, Platform.Repo,
#   adapter: Ecto.Adapters.Postgres,
#   url: System.get_env("DATABASE_URL"),
#   pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
#   ssl: true


# touch compile
# npm run deploy
# cd $phoenix_dir
# mix "${phoenix_ex}.digest"

#touch phoenix_static_buildpack.config
# Clean out cache contents from previous deploys
#clean_cache=false
# We can change the filename for the compile script with this option
#compile="compile"
# We can set the version of Node to use for the app here
#node_version=13.12.0
# We can set the version of NPM to use for the app here
#npm_version=6.14.4

###################################################
#### STEPS TO RUN POST INSTALL OF THE ABOVE SCRIPT 
###################################################

git clone https://github.com/au5720/platform.git
cd platform/
su - postgres <<'EOF'
psql -c "ALTER USER postgres PASSWORD 'postgres';" 
EOF
service restart postgres

cd assets
npm install
cd ../

mix deps.get
mix ecto.create
mix ecto.migrate
mix phx.server


