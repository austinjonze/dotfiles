$homedir = ENV['HOME']

task :bashrc do
    dot_bashrc = $homedir + '/.bashrc'
    bashrcFile = './files/bashrc'
    FileUtils.cp_r(dot_bashrc, dot_bashrc + '.bak')
    FileUtils.cp_r(bashrcFile, dot_bashrc)
end

task :bash => 'bashrc' do
    puts "Update bashrc & bash_profile"
    dot_bash_profile = $homedir + '/.bash_profile'
    bashProfileFile = './files/bash_profile'
    FileUtils.cp_r(dot_bash_profile, dot_bash_profile + '.bak')
    FileUtils.cp_r(bashProfileFile, dot_bash_profile)
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

task :update_vimrc do
    puts "Update .vimrc in repo"
end

task :update_vim do
    puts "Update vim in repo"
end

task :default => [:bash]

task :update_all => [:bash]
