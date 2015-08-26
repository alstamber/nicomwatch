#! /usr/bin/env ruby
require 'open-uri'
require 'nokogiri'
require 'fileutils'
require 'date'

def read_html(comno)
    charset = nil
    html = open("http://com.nicovideo.jp/community/co#{comno}") do |f|
        charset = f.charset
        f.read
    end
    return html, charset
end

def parse(html, charset)
    Nokogiri::HTML.parse(html, nil, charset)
end

def get_number_of_member(doc)
    member_text = doc.xpath('//div[@id="cbox_profile"]/table/tr[1]/td[1]/table/tr[2]/td[2]').text.strip
    match_data = /\d+/.match(member_text)
    match_data ? match_data[0] : '0'
end

def write_number(date, number_of_member)
    path = File.expand_path('../../log.txt', __FILE__)
    File.open(path, 'a') do |file|
        file.puts "#{date},#{number_of_member}"
    end
end


comno = ARGV[0]
html, charset = read_html(comno)
doc = parse(html, charset)
number_of_member = get_number_of_member(doc)
date = Date.today.strftime('%F')
write_number(date, number_of_member)
