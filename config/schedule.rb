set :output, 'log/crontab.log'

every 1.day, at: '0:00 am' do
  script "main.rb"
end
