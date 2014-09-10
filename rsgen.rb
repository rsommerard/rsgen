require 'thor'

class RSGen < Thor
  option :empty, :type => :boolean, :aliases => "-e"

  desc "html [filename]", "create a new html file"
  def html(filename = 'index')
    puts "new html file: #{filename}"
    puts "with empty option" if options[:empty]
  end
end

RSGen.start(ARGV)
