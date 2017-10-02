#Most install commands are described here with apt (Ubuntu/Mint/...) or yum (CentOS/RHEL/...)
#In most cases, replacing the name of your package manager should work if your distro does not use one of these two
#Else, Internet is your friend ;)

#sudoers
su
usermod -a -G wheel user_name
#if your group is sudo then
usermod -a -G sudo user_name
visudo
#in Vi
#after "Same thing without a password" line
esc+i
user_name		ALL=(ALL)	PASSWD: ALL
#check if indentation is coherent
esc
:wq

#PKM Updater
su
yum list updates
yum update

#GIT
sudo apt-get install git
#configure mail and name
git config --global user.email "your_email@your_mail_company.com"
git config --global user.name "your_github_username"
#init git repo on github
#init git repo (local)
git init
#add files
git add .
#commit them
git commit -m "initial commit"
#link local commit to github repo
git remote add origin https://github.com/user_name/git_repo.git
#push it on github
git push -u origin master

#If you have some authentication issues when trying to push the files
git remote add origin ssh://git@github.com/user_name/git_repo.git
#You might need to add an ssh key into Github still
#To do this :
cd ~/.ssh && ssh-keygen
#then copy the generated ssh key (usually filename is id_rsa.pub) in Github
#git push should work after this :)

#NPM
sudo yum install npm
#COMPOSER
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer.phar
alias composer='/usr/local/bin/composer.phar'
#BOWER
npm install -g bower
sudo ln -s /usr/bin/nodejs /usr/bin/node

composer install
bower install

#unrar files
#Ubuntu
sudo apt-get install unrar

#DROPBOX
#install
sudo apt-get install dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
#synchronize dropbox
~/.dropbox-dist/dropboxd 

#SUBLIME TEXT 3
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo yum-config-manager --add-repo https://download.sublimetext.com/rpm/stable/i386/sublime-text.repo
sudo yum install sublime-text

#bash completion
sudo yum install bash-completion
#in ~/.bashrc
source /etc/bash_completion

#EPEL REPO SetUp (CentOS)
wget http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
# check with
yum repolist

#GOLANG
sudo yum install golang
#in workspace (default : $HOME/go)
mkdir src bin pkg

#write this in ~/.bashrc
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


#PERL
#A compiler is needed
sudo yum install gcc
#check installs with
gcc -v
#install Perlbrew
sudo yum install perlbrew
#check install with
perlbrew
#then upgrade and install your desired perl version and cpan
perlbrew self-upgrade
perlbrew install -v http://cpan.org/src/5.0/perl-5.26.0.tar.gz -Dusethreads --as perl-5.26.0
#track installation with
tail -f ~/perl5/perlbrew/build.perl-5.26.0.log
#to install cpan/cpanm (module manager)
perlbrew install cpan
cpan reload
cpan
#do not forget to check if >
source /home/kyri/perl5/perlbrew/etc/bashrc
#is added into ~/.bashrc !
#check if the correct Perl version is installed from PerlBrew with
perl -v

#C/C++
sudo yum install gcc gcc-c++ make
#you can also do on Ubuntu
sudo apt-get install build-essentials

#LAMP (PHP/mysql/Apache/curl)
#Ubuntu
sudo apt-get install apache2 php5 mysql-server libapache2-mod-php5 php5-mysql curl
#CentOS
sudo yum install httpd php php-mysql php-gd php-pdo mysql-server mysql curl

#JAVA
sudo yum install java-1.8.0-openjdk-devel
#check compiler/interpreter
javac -version
java -version

#RUBY
sudo yum install ruby
#check with
ruby -v
#interactive Ruby (from console)
sudo yum install irb

#ERLANG
sudo wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
sudo yum install esl-erlang

#ELIXIR
#Erlang needed
sudo mkdir /opt/elixir
cd /opt/elixir/
sudo git clone https://github.com/elixir-lang/elixir.git /opt/elixir/
sudo make clean test
sudo ln -s /opt/elixir/bin/iex /usr/local/bin/iex
sudo ln -s /opt/elixir/bin/mix /usr/local/bin/mix
sudo ln -s /opt/elixir/bin/elixir /usr/local/bin/elixir
sudo ln -s /opt/elixir/bin/elixirc /usr/local/bin/elixirc

#PYTHON
sudo yum groupinstall "development tools"
sudo yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel 
wget http://python.org/ftp/python/3.6.2/Python-3.6.2.tar.xz
tar xf Python-3.6.2.tar.xz 
cd Python-3.6.2/
./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
sudo make && sudo make altinstall
#test pip
pip3.6
#test version on system
cd ~
python --version
cd python3.6 | mkdir python3.6
#create virtual environment
python3.6 -m venv firstPyPrj
source firstPyPrj/bin/activate
python --version
deactivate