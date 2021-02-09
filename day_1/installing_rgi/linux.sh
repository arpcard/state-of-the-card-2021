# Requirements
# Python 3.6
# NCBI BLAST 2.6.0
# Prodigal 2.6.3
# DIAMOND 0.8.36

# setup enviroments

# install system dependencies
apt-get update && \
apt-get install -y git python3 python3-dev python3-pip ncbi-blast+ prodigal wget && \
wget http://github.com/bbuchfink/diamond/releases/download/v0.8.36/diamond-linux64.tar.gz && \
tar xvf diamond-linux64.tar.gz && \
mv diamond /usr/bin

# install Jellyfish using executable

wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.10/jellyfish-linux
mv jellyfish-linux jellyfish
mv jellyfish /usr/bin 

# download rgi
wget -O software.tar.bz2 https://github.com/arpcard/rgi/archive/master.zip
mkdir -p software
tar xvf software.tar.bz2 -C software
rm software.tar.bz2

# install and test rgi
pip3 install -r ./software/rgi-master/requirements.txt && pip3 install ./software/rgi-master/

# remove folder
rm -r software

# load CARD databases using auto_load locally
rgi auto_load  --local --debug --clean

# check installed databases
rgi database -v --local --all

# Done.
echo "Done."