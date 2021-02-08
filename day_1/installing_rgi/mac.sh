# Requirements
# Python 3.6
# NCBI BLAST 2.6.0
# Prodigal 2.6.3
# DIAMOND 0.8.36

# install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install pyenv 
brew install pyenv

# Enable pyenv in your Bash shell, you need to run:
eval "$(pyenv init -)"

# Note add `eval "$(pyenv init -)"` to ~/.bash_profile

# Usage: Once you have installed pyenv and activated it, you can install different versions of python and choose which one you can use. 
# Example:
pyenv install 2.7.5

# You can check the versions you have installed with:
pyenv versions

# And you can switch between python versions with the command:
pyenv global 3.6.1
pyenv global 2.7.10

# Also you can set a python version for the current directory with:
pyenv local 2.7.10
pyenv local 3.6.1

# You can check by running python --version:
python --version

# or install python3 using brew
brew install python3

# install wget using brew and also enable openressl for TLS support
brew install wget --with-libressl

# download and install Prodigal
wget https://github.com/hyattpd/Prodigal/archive/v2.6.3.tar.gz && \
tar xvf v2.6.3.tar.gz && rm v2.6.3.tar.gz && \
cd Prodigal-2.6.3/ && \
make install 

# install DIAMOND
wget http://github.com/bbuchfink/diamond/releases/download/v0.8.36/diamond-linux64.tar.gz && \
tar xvf diamond-linux64.tar.gz && \
mv diamond /usr/bin

# download rgi
wget -O software.tar.bz2 https://github.com/arpcard/rgi/archive/4.2.2.tar.gz
mkdir -p software
tar xvf software.tar.bz2 -C software
rm software.tar.bz2


# install and test rgi
cd software/rgi-4.2.2/
pip3 install -r requirements.txt && \
pip3 install . && \
bash test.sh

# install Jellyfish
wget https://github.com/gmarcais/Jellyfish/archive/v2.2.10.tar.gz
tar 
./configure --prefix=/usr/bin
make -j 4
make install

# or use executable

wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.10/jellyfish-macosx
mv jellyfish-linux jellyfish
mv jellyfish /usr/bin 

# Done.
echo "Done."