# Photo App 

## Setup: Homepage 

```bash
  $ rails generate controller welcome index
```
set the get route to the root route 
```ruby
  root "welcome#index"
```

## Setup: gemfile database
move the gem sqlite3 to the deleopment test group 
add the 'pg' gem to a new group :production 
```ruby
group :production do
  gem "pg"
end
```
then update gemfile.lock by running 
```bash
  $ bundle install --without production
```
## Deploy to Heroku 
Make sure to commit all changes to the git repository and then create and push to heroku
```bash
  $ heroku create 
  $ heroku rename <new-name>
  $ git push heroku master
```
Remember to use $ heroku run rails db:migrate when we push to heroku any commits. Only if we have any changes in database tables. So for now, we dont need to run this commande. 

## Add Favicon 
Add favicon.ico to App/assets/Images 
display favicon by updating app/views/layout/application.html.erb 
```ruby
  <%= favicon_link_tag %>
```
references: https://semantic-ui.com/elements/icon.html

## Images references 
Unsplash : https://unsplash.com/

## Setup: Authentication system 
Add gems for devise and as well for Boostrap styling 
```ruby
  gem 'devise'
  gem 'devise-bootstrap-views'
  gem 'twitter-bootstrap-rails'
  gem 'jquery-rails'
```
run $ bundle install --without production 

Setup Devise User

```bash 
  $ rails generate devise:install 
  $ rails generate devise User
```

Add trackable and Confirmable to our Users Migration file and User Model file 
Migration file (uncomment): 
```ruby
        ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email 
```
User model (add):
```ruby
devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
```

Run 
```bash
  $ rails db:migrate
```

Require a user authentication before action in all route actions 
Add in application controller =>  
```ruby
  protect_from_forgery with: :exception
  before_action :authenticate_user!
```
Except for our root "homepage": 
in welcome_controller, specify the skip action only for our :index action
```ruby
  skip_before_action :authenticate_user!, only: [:index]
```

## Setup: Boostrap layouts 
```bash
  $ rails generate bootstrap:install static
  $ rails g bootstrap:layout application (yes overwrite)
  $ rails g devise:views:locale en 
  $ rails g devise:views:bootstrap_templates
```

Very important to make this work with rails 6 !
=> Delete favicon links in app/views/layouts/application.html.erb
```bash
Add "//= require jquery" in app/assets/javascript/application.js 
Add "//= link application.js" in app/assets/config/manifest.js
```

## Kill a local running rails server if terminal closed
```bash
  $ kill -9 $(lsof -i tcp:3000 -t)
```
resources: https://stackoverflow.com/questions/24627701/a-server-is-already-running-check-tmp-pids-server-pid-exiting-rails