set :output, 'log/crontab.log'

comno = "2500567"

every 1.day, at: '0:00 am' do
  script "main.rb #{comno}"
end
