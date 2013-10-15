require 'rake'

task :default => [:install]

desc "Install vim files into user's home directory"
task :install => [:link, :initialise] do
end

desc "Links vim rc files"
task :link do

  link_file 'vim'
  link_file 'vimrc'
  link_file 'gvimrc'

end

desc "initialise git submodules"
task :initialise do
  sh 'git submodule init'
  sh 'git submodule update'
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
