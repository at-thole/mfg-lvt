require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'

class Funny
  def self.main
    puts  ""
    puts "What do you want ? ".blue.on_white
    puts "1. Listen to musics".blue.on_white
    puts "2. Watching fimls  ".blue.on_white
    puts "3. Play games      ".blue.on_white
    puts "Please select :    "
    Funny.new.select_menu
  end

  def select_menu
    choose = gets.chomp.to_i
    case choose
    when 1
      list_suggest "musics"
    when 2
      list_suggest "films"
    when 3
      list_suggest "games"
    else
      puts "Please select 1 to 3"
      return
    end
  end

  def list_suggest text
    html = open("https://tho-server.herokuapp.com/#{text}")
    doc = Nokogiri::HTML(html.read)
    doc.encoding = 'utf-8'
    list = doc.css("body .list-#{text}").to_a
    puts "List #{text} for you"
    list.each_with_index do |item, index_item|
      object = item.text.split("\n")
      object.each_with_index do |object_name, index|
        if index == 1
          puts "#{index_item+1}. #{object_name.split.join(' ')}".blue.on_white
          print "  #{index_item+1}.1 Open".green
          text.eql?("musics") ? (print "  #{index_item+1}.2 Lyrics".yellow) : (print "  #{index_item+1}.2 Description".yellow)
          puts  "  #{index_item+1}.3 Download"
          puts  ""
        end
      end
      if (index_item+1) == list.length
        begin
          puts "Please select: "
          selected = gets.chomp
          result_select = selected.split(".")
          raise "Please select x.1 -> x.3" unless (1..3).include?(result_select[1].to_i)
          case result_select[1].to_i
          when 1
            music_selected = list[result_select[0].to_i-1].text.split("\n")[2].split.join(' ')
            system("xdg-open", music_selected)
          when 2
            puts list[result_select[0].to_i-1].text.split("\n")[3].split.join(' ').white.on_blue
          when 3
          end
        rescue Exception => e
          puts e.message
        end
      end
    end
  end
end
