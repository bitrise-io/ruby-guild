# Rails project structure

## Default structure
The project in this folder was generated with the `rails new` command:

```sh
$ rails new myapp -d postgresql
      create
      create  README.md
      create  Rakefile
      create  .ruby-version
      create  config.ru
      create  .gitignore
      create  Gemfile
         run  git init from "."
Initialized empty Git repository in /.../myapp/.git/
      create  package.json
      create  app
      create  app/assets/config/manifest.js
      create  app/assets/stylesheets/application.css
      create  app/channels/application_cable/channel.rb
      create  app/channels/application_cable/connection.rb
      create  app/controllers/application_controller.rb
      create  app/helpers/application_helper.rb
      create  app/javascript/channels/consumer.js
      create  app/javascript/channels/index.js
      create  app/javascript/packs/application.js
      create  app/jobs/application_job.rb
      create  app/mailers/application_mailer.rb
      create  app/models/application_record.rb
      create  app/views/layouts/application.html.erb
      create  app/views/layouts/mailer.html.erb
      create  app/views/layouts/mailer.text.erb
      create  app/assets/images
      create  app/assets/images/.keep
      create  app/controllers/concerns/.keep
      create  app/models/concerns/.keep
      create  bin
      create  bin/rails
      create  bin/rake
      create  bin/setup
      create  bin/yarn
      create  config
      create  config/routes.rb
      create  config/application.rb
      create  config/environment.rb
      create  config/cable.yml
      create  config/puma.rb
      create  config/spring.rb
      create  config/storage.yml
      create  config/environments
      create  config/environments/development.rb
      create  config/environments/production.rb
      create  config/environments/test.rb
      create  config/initializers
      create  config/initializers/application_controller_renderer.rb
      create  config/initializers/assets.rb
      create  config/initializers/backtrace_silencers.rb
      create  config/initializers/content_security_policy.rb
      create  config/initializers/cookies_serializer.rb
      create  config/initializers/cors.rb
      create  config/initializers/filter_parameter_logging.rb
      create  config/initializers/inflections.rb
      create  config/initializers/mime_types.rb
      create  config/initializers/new_framework_defaults_6_0.rb
      create  config/initializers/wrap_parameters.rb
      create  config/locales
      create  config/locales/en.yml
      create  config/master.key
      append  .gitignore
      create  config/boot.rb
      create  config/database.yml
      create  db
      create  db/seeds.rb
      create  lib
      create  lib/tasks
      create  lib/tasks/.keep
      create  lib/assets
      create  lib/assets/.keep
      create  log
      create  log/.keep
      create  public
      create  public/404.html
      create  public/422.html
      create  public/500.html
      create  public/apple-touch-icon-precomposed.png
      create  public/apple-touch-icon.png
      create  public/favicon.ico
      create  public/robots.txt
      create  tmp
      create  tmp/.keep
      create  tmp/pids
      create  tmp/pids/.keep
      create  tmp/cache
      create  tmp/cache/assets
      create  vendor
      create  vendor/.keep
      create  test/fixtures
      create  test/fixtures/.keep
      create  test/fixtures/files
      create  test/fixtures/files/.keep
      create  test/controllers
      create  test/controllers/.keep
      create  test/mailers
      create  test/mailers/.keep
      create  test/models
      create  test/models/.keep
      create  test/helpers
      create  test/helpers/.keep
      create  test/integration
      create  test/integration/.keep
      create  test/channels/application_cable/connection_test.rb
      create  test/test_helper.rb
      create  test/system
      create  test/system/.keep
      create  test/application_system_test_case.rb
      create  storage
      create  storage/.keep
      create  tmp/storage
      create  tmp/storage/.keep
      remove  config/initializers/cors.rb
      remove  config/initializers/new_framework_defaults_6_0.rb
         run  bundle install
The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
Fetching gem metadata from https://rubygems.org/............
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Fetching rake 13.0.3
Installing rake 13.0.3
Using concurrent-ruby 1.1.7
Fetching i18n 1.8.7
Installing i18n 1.8.7
Using minitest 5.14.2
Using thread_safe 0.3.6
Fetching tzinfo 1.2.9
Installing tzinfo 1.2.9
Using zeitwerk 2.4.2
Using activesupport 6.0.3.4
Using builder 3.2.4
Using erubi 1.10.0
Fetching mini_portile2 2.5.0
Installing mini_portile2 2.5.0
Fetching racc 1.5.2
Installing racc 1.5.2 with native extensions
Fetching nokogiri 1.11.0 (x86_64-darwin)
Installing nokogiri 1.11.0 (x86_64-darwin)
Using rails-dom-testing 2.0.3
Using crass 1.0.6
Using loofah 2.8.0
Using rails-html-sanitizer 1.3.0
Using actionview 6.0.3.4
Using rack 2.2.3
Using rack-test 1.1.0
Using actionpack 6.0.3.4
Using nio4r 2.5.4
Using websocket-extensions 0.1.5
Using websocket-driver 0.7.3
Using actioncable 6.0.3.4
Using globalid 0.4.2
Using activejob 6.0.3.4
Using activemodel 6.0.3.4
Using activerecord 6.0.3.4
Using mimemagic 0.3.5
Using marcel 0.3.3
Using activestorage 6.0.3.4
Using mini_mime 1.0.2
Using mail 2.7.1
Using actionmailbox 6.0.3.4
Using actionmailer 6.0.3.4
Using actiontext 6.0.3.4
Using public_suffix 4.0.6
Using addressable 2.7.0
Using bindex 0.8.1
Using msgpack 1.3.3
Using bootsnap 1.5.1
Using bundler 1.17.3
Using byebug 11.1.3
Using regexp_parser 1.8.2
Using xpath 3.2.0
Using capybara 3.34.0
Using childprocess 3.0.0
Fetching ffi 1.14.2
Installing ffi 1.14.2 with native extensions
Using jbuilder 2.10.1
Using rb-fsevent 0.10.4
Using rb-inotify 0.10.1
Fetching listen 3.4.0
Installing listen 3.4.0
Using method_source 1.0.0
Using pg 1.2.3
Using puma 4.3.7
Using rack-proxy 0.6.5
Using thor 1.0.1
Using railties 6.0.3.4
Using sprockets 4.0.2
Using sprockets-rails 3.2.2
Using rails 6.0.3.4
Using rubyzip 2.3.0
Using sassc 2.4.0
Using tilt 2.0.10
Using sassc-rails 2.1.2
Using sass-rails 6.0.0
Using selenium-webdriver 3.142.7
Using spring 2.1.1
Using spring-watcher-listen 2.0.1
Using turbolinks-source 5.2.0
Using turbolinks 5.2.1
Using web-console 4.1.0
Fetching webdrivers 4.4.2
Installing webdrivers 4.4.2
Using webpacker 4.3.0
Bundle complete! 17 Gemfile dependencies, 75 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
         run  bundle binstubs bundler
The dependency tzinfo-data (>= 0) will be unused by any of the platforms Bundler is installing for. Bundler is installing for ruby but the dependency is only for x86-mingw32, x86-mswin32, x64-mingw32, java. To add those platforms to the bundle, run `bundle lock --add-platform x86-mingw32 x86-mswin32 x64-mingw32 java`.
         run  bundle exec spring binstub --all
* bin/rake: Spring inserted
* bin/rails: Spring inserted
       rails  webpacker:install
      create  config/webpacker.yml
Copying webpack core config
      create  config/webpack
      create  config/webpack/development.js
      create  config/webpack/environment.js
      create  config/webpack/production.js
      create  config/webpack/test.js
Copying postcss.config.js to app root directory
      create  postcss.config.js
Copying babel.config.js to app root directory
      create  babel.config.js
Copying .browserslistrc to app root directory
      create  .browserslistrc
The JavaScript app source directory already exists
       apply  /Users/puzzles/.rbenv/versions/2.5.7/lib/ruby/gems/2.5.0/gems/webpacker-4.3.0/lib/install/binstubs.rb
  Copying binstubs
       exist    bin
      create    bin/webpack
      create    bin/webpack-dev-server
      append  .gitignore
Installing all JavaScript dependencies [4.3.0]
         run  yarn add @rails/webpacker@4.3.0 from "."
yarn add v1.22.10
info No lockfile found.
[1/4] 🔍  Resolving packages...
warning @rails/webpacker > node-sass > request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
warning @rails/webpacker > node-sass > node-gyp > request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
warning @rails/webpacker > node-sass > request > har-validator@5.1.5: this library is no longer supported
warning @rails/webpacker > webpack > watchpack > watchpack-chokidar2 > chokidar@2.1.8: Chokidar 2 will break on node v14+. Upgrade to chokidar 3 with 15x less dependencies.
warning @rails/webpacker > webpack > watchpack > chokidar > fsevents@2.1.3: Please update to v 2.2.x
warning @rails/webpacker > webpack > watchpack > watchpack-chokidar2 > chokidar > fsevents@1.2.13: fsevents 1 will break on node v14+ and could be using insecure binaries. Upgrade to fsevents 2.
warning @rails/webpacker > webpack > micromatch > snapdragon > source-map-resolve > resolve-url@0.2.1: https://github.com/lydell/resolve-url#deprecated
warning @rails/webpacker > webpack > micromatch > snapdragon > source-map-resolve > urix@0.1.0: Please see https://github.com/lydell/urix#deprecated
[2/4] 🚚  Fetching packages...
[3/4] 🔗  Linking dependencies...
[4/4] 🔨  Building fresh packages...
success Saved lockfile.
success Saved 600 new dependencies.
info Direct dependencies
├─ @rails/actioncable@6.1.0
├─ @rails/activestorage@6.1.0
├─ @rails/ujs@6.1.0
├─ @rails/webpacker@4.3.0
└─ turbolinks@5.2.0
info All dependencies
├─ @babel/code-frame@7.12.11

...

└─ yargs-parser@13.1.2
✨  Done in 145.41s.
Installing dev server for live reloading
         run  yarn add --dev webpack-dev-server from "."
yarn add v1.22.10
[1/4] 🔍  Resolving packages...
[2/4] 🚚  Fetching packages...
[3/4] 🔗  Linking dependencies...
warning "webpack-dev-server > webpack-dev-middleware@3.7.3" has unmet peer dependency "webpack@^4.0.0 || ^5.0.0".
warning " > webpack-dev-server@3.11.1" has unmet peer dependency "webpack@^4.0.0 || ^5.0.0".
[4/4] 🔨  Building fresh packages...
success Saved lockfile.
success Saved 104 new dependencies.
info Direct dependencies
└─ webpack-dev-server@3.11.1
info All dependencies
├─ @types/glob@7.1.3

...

└─ ws@6.2.1
✨  Done in 7.47s.
Webpacker successfully installed 🎉 🍰
```

## Resources

I also added a `Widget` resource by generating a scaffold for it:

```sh
$ rails generate scaffold Widget name:string price:decimal
Running via Spring preloader in process 78550
      invoke  active_record
      create    db/migrate/20210105070509_create_widgets.rb
      create    app/models/widget.rb
      invoke    test_unit
      create      test/models/widget_test.rb
      create      test/fixtures/widgets.yml
      invoke  resource_route
       route    resources :widgets
      invoke  scaffold_controller
      create    app/controllers/widgets_controller.rb
      invoke    erb
      create      app/views/widgets
      create      app/views/widgets/index.html.erb
      create      app/views/widgets/edit.html.erb
      create      app/views/widgets/show.html.erb
      create      app/views/widgets/new.html.erb
      create      app/views/widgets/_form.html.erb
      invoke    test_unit
      create      test/controllers/widgets_controller_test.rb
      create      test/system/widgets_test.rb
      invoke    helper
      create      app/helpers/widgets_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/widgets/index.json.jbuilder
      create      app/views/widgets/show.json.jbuilder
      create      app/views/widgets/_widget.json.jbuilder
      invoke  assets
      invoke    scss
      create      app/assets/stylesheets/widgets.scss
      invoke  scss
      create    app/assets/stylesheets/scaffolds.scss
```
