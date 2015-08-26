# nicomwatch
Watch the number of members in specified niconico-community and record it every day.

# How to use
1. Run command
  ```bash
  bundle install --path=vendor/bundle
  mkdir log
  ```

1. Edit `config/schedule.rb`
  ```ruby
  set :output, 'log/crontab.log'
  
  comno = "2500567" # Edit here
  
  every 1.day, at: '0:00 am' do
    script "main.rb #{comno}"
  end
  ```
  
1. Then update crontab
  ```bash
  bundle exec whenever -i
  ```

# Log format
```
2015-01-01,1000
2015-01-02,1012
...
```
