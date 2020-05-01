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

