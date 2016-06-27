function install {
  echo installing $1
  shift
  sudo apt-get -y install "$@" >/dev/null 2>&1
}

echo just updating
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

sudo apt-get update
install 'development tools' build-essential
install Ruby ruby2.3 ruby2.3-dev
update-alternatives --set ruby /usr/bin/ruby2.3 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.3 >/dev/null 2>&1

gem install bundler -N >/dev/null 2>&1
install Git git
install SQLite sqlite3 libsqlite3-dev
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'all set, garba karo!!'
