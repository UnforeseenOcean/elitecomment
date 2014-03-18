#!/usr/bin/env ruby
require 'leetspeak'
require 'tempfile'
require 'fileutils'

arg = File.expand_path(ARGV[0])
abort('u54g3: elite.rb <d1r3c70ry|f1l3>') unless arg
abort("3rr0r: c4nn0t f1nd #{arg}") unless File.exists?(arg)


files = Dir.exists?(arg) ?  Dir.glob(arg + '/**/*.rb') : [arg]

print "l33tz0r1ng #{files.size} f1l3z. j00 5ur3?: "
answer = $stdin.gets.chomp
abort("k") unless answer == 'y3s'

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
    puts '%4d c0mm3n75: %s' % [count, path]
  ensure
    tmp.close
    tmp.unlink
  end
end
