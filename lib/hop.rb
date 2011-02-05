require 'yaml'
require 'trollop'

class Hop
  class << self
    def run
      ARGV[0] = '-h' unless ARGV[0]
      opts = Trollop::options do
        opt :add, "Add URL like: apple:http://www.apple.com", :type => String
        opt :force, "Force overwriting of existing keys"
        opt :list
      end

      $bookmarks_file = File.join(ENV['HOME'], '.hop', 'bookmarks.yml')

      bookmarks = {}

      if(!File.exists?(File.dirname($bookmarks_file)))
        Dir.mkdir(File.dirname($bookmarks_file))
      end

      if(File.exist?($bookmarks_file))
        bookmarks = YAML::load_file($bookmarks_file)
      end

      if opts[:add_given]
        key, *url = opts[:add].split(':')
        if(bookmarks[key] && !opts[:force_given])
          puts "You already have a bookmark for #{key}: #{url.join(':')}"
          puts "Please add -f if you want to replace it."
        else
          File.open($bookmarks_file, 'w') do |file|
            YAML::dump(bookmarks.merge(key => url.join(':')), file)
          end
        end
      elsif opts[:list_given]
        printf("%-16s %s\n", "key", "bookmark")
        puts "-" * 70
        bookmarks.each do |key, bookmark|
          printf("%-16s %s\n", key, bookmark)
        end
      else
        parts = ARGV[0].split(//).map{|part| Regexp.escape(part) }
        regex = Regexp.new(/.*#{parts.join('.*')}.*/)
        urls = bookmarks.keys.select do |u|
          u.to_s.match(regex)
        end

        if(ARGV[1] &&
           urls[ARGV[1].to_i])
          urls = [urls[ARGV[1].to_i]]
        end

        case urls.length
        when 0:
          puts "No URLS found matching #{ARGV.inspect}"
        when 1:
          `open #{bookmarks[urls.first]}`
        else
          urls.each_with_index do |url, index|
            puts "#{index}: #{url}"
          end
        end
      end
    end
  end
end
