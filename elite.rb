#!/usr/bin/env ruby
require 'leetspeak'
require 'tempfile'
require 'fileutils'

arg = File.expand_path(ARGV[0])
abort('usage: elite <directory|file>') unless arg
abort("error: cannot find #{arg}") unless File.exists?(arg)

files = Dir.exists?(arg) ?  Dir.glob(arg + '/**/*.rb') : [arg]

files.each do |path|
  tmp = Tempfile.new('working')
  count = 0
  begin
    File.open(path) do |file|

      file.each_line do |line|
        if line =~ /\A\s+?#/
          tmp.puts line.leet(false)
          count += 1
        else
          tmp.puts line
        end
      end

    end

    tmp.rewind
    FileUtils.mv(tmp.path, path)
    puts '%4d comments: %s' % [count, path]
  ensure
    tmp.close
    tmp.unlink
  end
end
