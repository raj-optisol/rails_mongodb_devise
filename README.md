## Rails 4 + Mongodb + Devise + Associations Example Application

### Stack
```ruby
ruby 2.1.5
Rails gem 4.1.8
Mongodb 2.6.5
devise gem 3.4.1
```

###You can just checkout and run the application

###Getting started Rails with Mongodb

```ruby
$ rails new sample_mongodb_app -T -O
```

Use the -T -O flags to skip Test::Unit files and Active Record files.

####Add this two gem:
```ruby
gem 'mongoid', '~> 4', github: 'mongoid/mongoid'
gem 'bson_ext'
```

####Run the following
```ruby
bundle install
rails g mongoid:config
rails g scaffold User name:string
```
#### Add the following method into devise model to fix session conflict error when login with devise
```ruby
  def to_key
    if key = super
      key = key.map(&:to_s)
    end
    key
  end
```

#### for Models created_at, updated_at fields add the following into the model you want
```ruby
include Mongoid::Timestamps
```