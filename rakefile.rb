$homedir = ENV['HOME']

task :bashrc do
    puts "Copy bashrc"
    bashrc = $homedir + '/.bashrc'
    bashrcFile = './files/bashrc'
    FileUtils.cp_r(bashrcFile, bashrc)
end

task :bash_profile => 'bashrc' do
    puts "Copy bash_profile to $HOME"
    bash_profile = $homedir + '/.bash_profile'
    bashProfileFile = './files/bash_profile'
    FileUtils.cp_r(bashProfileFile, bash_profile)
end

task :copy_vim do
    dotvim = $homedir + '/.vim'
    if(File.directory?(dotvim))
        puts "Does Exist"
    else
        vimdir = './files/vim'
        FileUtils.cp_r(vimdir, dotvim)
    end
end

task :copy_vimrc => 'copy_vim' do
    puts "Copy vimrc file to $HOME"
    dotvimrc = $homedir + '/.vimrc'
    puts File.file?(dotvimrc)
end

task :copy_sublime_settings do
    puts "copy sublime settings appropriately"
end

task :update_bashrc do
    puts "Update .bashrc"
end

task :update_bash_profile do
    puts "Update .bash_profile"
end

task :update_vimrc do
    puts "Update .vimrc in repo"
end

task :update_vim do
    puts "Update vim in repo"
end

task :default => [:copy_bash_profile, :copy_vimrc]

task :update_all => [:update_vimrc, :update_vim, :update_bashrc, :update_bash_profile]
