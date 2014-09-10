require 'thor'

DEBUG = true

class RSGen < Thor

  desc "html [-e] [filename]", "Create a new html file"
  option :empty, :type => :boolean, :aliases => "-e"
  def html(filename = 'index')
    if options[:empty]
      create_html_file(filename)
      return
    end

    content = "<!DOCTYPE>\n"
    content += "<html>\n"
    content += "  <head>\n"
    content += "    <meta charset='UTF-8'>\n"
    content += "    <title>#{ filename }</title>\n"
    content += "  </head>\n"
    content += "  <body>\n"
    content += "  </body>\n"
    content += "</html>\n"

    create_html_file(filename, content)
  end

  desc "js [filename]", "Create a new js file"
  def js(filename = 'main')
    create_js_file(filename)
  end

  desc "css [filename]", "Create a new css file"
  def css(filename = 'style')
    create_css_file(filename)
  end

  private

  def create_html_file(filename, content = nil)
    path = generate_path(filename, 'html')
    create_file(path, content)
  end

  def create_js_file(filename, content = nil)
    path = generate_path(filename, 'js')
    create_file(path, content)
  end

  def create_css_file(filename, content = nil)
    path = generate_path(filename, 'css')
    create_file(path, content)
  end

  def create_file(path, content)
    File.open(path, 'w') { |file| file.write(content) }
    puts "#{ path } created."
  end

  def generate_path(filename, extension)
    path = "#{ filename }.#{ extension }"

    i = 1
    while File.exist?(path) do
      puts "#{ path } already exist."
      path = "#{ filename }" + i.to_s + ".#{ extension }"
      i += 1
    end

    return path
  end
end

RSGen.start(ARGV)
