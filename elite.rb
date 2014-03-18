#!/usr/bin/env ruby


arg = File.expand_path(ARGV[0])
abort('usage: elite <directory|file>') unless arg
abort("error: cannot find #{arg}") unless File.exists?(arg)

files = Dir.exists?(arg) ?  Dir.glob(arg + '/**/*.rb') : [arg]

files.each do |path|
  File.open(path) do |file|
    file.each_line do |line|
       line if line =~ /\A\s+?#/
    end
  end
end
