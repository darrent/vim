require 'rake'

task :default => [:install]

desc "Install vim files into user's home directory"
task :install => [:link] do
end

desc "Links vim rc files"
task :link do

  link_folder 'vim'
  ['vimrc', 'gvimrc' ].each { |link| link_file link  }
end

desc "Remove links"
task :unlink do
  unlink 'vim'
  unlink 'vimrc'
  unlink 'gvimrc'
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def link_folder(folder)
  puts "linking folder ~/.#{folder}"
  system %Q{ln -s "$PWD/" "$HOME/.#{folder}"}
end

def unlink(link)
  puts "unlinking link ~/.#{link}"
  system %Q{rm "$HOME/.#{link}"} if File.exist?('$HOME/.#{link}')
end
