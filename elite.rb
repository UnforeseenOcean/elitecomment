#!/usr/bin/env ruby
arg = File.expand_path(ARGV[0])
abort('usage: elite <directory|file>') unless arg
abort("error: cannot find #{arg}") unless File.exists?(arg)

puts arg
