$homedir = ENV['HOME']

task :bashrc do
    dot_bashrc = $homedir + '/.bashrc'
    bashrcFile = './files/bashrc'
    FileUtils.cp_r(dot_bashrc, dot_bashrc + '.bak')
    FileUtils.cp_r(bashrcFile, dot_bashrc)
end
desc "Setup Bashfiles"
task :bash => 'bashrc' do
    puts "Update bashrc & bash_profile"
    dot_bash_profile = $homedir + '/.bash_profile'
    bashProfileFile = './files/bash_profile'
    #FileUtils.cp_r(dot_bash_profile, dot_bash_profile + '.bak')
    FileUtils.cp_r(bashProfileFile, dot_bash_profile)
end

task :vim do
    dotvim = $homedir + '/.vim'
    if(!File.directory?(dotvim))
        FileUtils.mkdir(dotvim)
    end

    vimdir = './files/vim/.'
    FileUtils.cp_r(vimdir, dotvim)
end

desc "Install vim configuration"
task :vimrc => 'vim' do
    dotvimrc = $homedir + '/.vimrc'
    vimrc = './files/vimrc'
    #FileUtils.cp_r(dotvimrc, dotvimrc + '.bak')
    FileUtils.cp_r(vimrc, dotvimrc)
end

desc "Setup Sublime"
task :sublime do
   shortcut_sublime = `sudo ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/bin/subl`
   printf "If needed execute Pakcage Manger script within Sublime Text 2\n"
end

task :default => [:bash]

task :update_all => [:bash]
