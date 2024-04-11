def main
  readme = "./README.md"

  update_header_footer(readme)
  update_time(readme)
end

def update_header_footer(readme)
  regex = /<img src="\.\/pokemon\/.+\.png" width="1000">/
  image = Dir.glob('./pokemon/*.png').sample
  new_image = "<img src=\"#{image}\" width=\"1000\">"
  replace_text(readme, regex, new_image)
end

def update_time(readme)
  regex = /(\d{4})\/(\d{1,2})\/(\d{1,2}) (\d{1,2}):(\d{2})/
  current_time = Time.now.strftime("%Y/%-m/%-d %H:%M")
  replace_text(readme, regex, current_time)
end

def replace_text(readme, regex, replacement)
  file_content = File.read(readme)
  new_content = file_content.gsub(regex, replacement)

  File.open(readme, "w") do |file|
    file.write(new_content)
  end
end

main
