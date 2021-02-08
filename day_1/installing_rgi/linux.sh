# Requirements
# Python 3.6
# NCBI BLAST 2.6.0
# Prodigal 2.6.3
# DIAMOND 0.8.36

# install system dependencies
apt-get update && \
apt-get install -y git python3 python3-dev python3-pip ncbi-blast+ prodigal wget && \
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

wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.10/jellyfish-linux
mv jellyfish-linux jellyfish
mv jellyfish /usr/bin 


# Done.
echo "Done."