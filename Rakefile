require 'rake'

desc "Install vim files into user's home directory"
task :install do

  link_file 'vim'
  link_file '.vimrc'
  link_file '.gvimrc'

end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
