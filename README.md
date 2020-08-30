# DoctoRuby

## Preview
![Demo](demo/doctoruby.gif)
 
#### Mandatory Technologies
  - Ruby On Rails
  - Bootstrap
  - rspec, faker, factory_bot_rails
 
#### Prerequisites

* Ruby 2.7
* Rails 6.0.3.2
* Bundler
* mysql2

## Install

Clone the repository for your environment
```
$ git clone https://github.com/Braullio/doctoruby.git
```

Go to the doctoruby directory and run the bundler to install the project dependencies
```
$ cd doctoruby
$ bundle install
```

Creating file 'config/app_environment_variables.rb' to database. 
```
ENV['DB_USER'] = 'user'.freeze
ENV['DB_PASS'] = 'senha'.freeze
ENV['DB_URL']  = 'localhost'.freeze
```

Creating database for using project.
```
$ rails db:create db:migrate
```

Now just start the development server and access it through the browser.
Default URL: http://localhost:3000
```
$ rails s
```

## Execute testings
  Tests were written for models, controllers and routes. In the project folder, you must execute the command below.
```
$ rails spec
```
 
