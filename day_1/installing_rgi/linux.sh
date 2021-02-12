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

# bowtie2
wget https://github.com/BenLangmead/bowtie2/releases/download/v2.3.4.3/bowtie2-2.3.4.3-linux-x86_64.zip && \
unzip bowtie2-2.3.4.3-linux-x86_64.zip && \
mv bowtie2-2.3.4.3-linux-x86_64/bowtie2* /usr/bin

# samtools
wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 && \
tar jxf samtools-1.9.tar.bz2 && \
pushd samtools-1.9 && ./configure && make && sudo mv samtools /usr/bin && popd

# bamtools
wget https://github.com/pezmaster31/bamtools/archive/v2.5.1.tar.gz && \
tar xzf v2.5.1.tar.gz && \
pushd bamtools-2.5.1/ && mkdir build && cd build && cmake .. && make && sudo make install && popd

# bedtools
wget https://github.com/arq5x/bedtools2/releases/download/v2.28.0/bedtools && \
chmod +x bedtools && sudo mv bedtools /usr/bin

# bwa
git clone https://github.com/lh3/bwa.git && \
pushd bwa && make && sudo mv bwa /usr/bin && popd

# jellyfish
wget https://github.com/gmarcais/Jellyfish/releases/download/v2.2.10/jellyfish-linux && \
mv jellyfish-linux jellyfish && chmod +x jellyfish && sudo mv jellyfish /usr/bin

# kma
git clone https://bitbucket.org/genomicepidemiology/kma.git && \
pushd kma && make && sudo mv kma /usr/bin && popd

# download rgi
wget https://github.com/arpcard/rgi/archive/master.zip && unzip master.zip && rm master.zip

# install and test rgi
pip3 install -r ./rgi-master/requirements.txt && pip3 install ./rgi-master/

# remove folder
rm -r rgi-master

# load CARD databases using auto_load locally
rgi auto_load  --local --debug --clean

# check installed databases
rgi database -v --local --all

# Done.
echo "Done."