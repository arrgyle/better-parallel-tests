def greplines(filename, regex)
  lineno = 0
  File.open(filename) do |file|
    file.each_line do |line|
      puts "#{lineno += 1}: #{line}" if line =~ regex
    end
  end
end

greplines 'a_spec.rb', /it /
