#! /bin/bash

#g++,cpanm,bwa,samtools,pindel,primer3,MFEprimer,pypy,psutil
#-------------------------------------------------------------#

#make directory
indel_platform=Downloads/InDel_platform
program_dir=/usr/local/program
cd
mkdir -p $indel_platform
sudo mkdir -p $program_dir

###################################################
#get SIP
if [ ! -f $indel_platform/sip-4.15.3.tar.gz ];then
    wget -P $indel_platform/ http://cznic.dl.sourceforge.net/project/pyqt/sip/sip-4.15.3/sip-4.15.3.tar.gz
fi

#get gnuplot
if [ ! -f $indel_platform/gnuplot-4.6.3.tar.gz ];then
    wget -P $indel_platform/ http://heanet.dl.sourceforge.net/project/gnuplot/gnuplot/4.6.3/gnuplot-4.6.3.tar.gz
fi

#get MUMmer3
if [ ! -f $indel_platform/MUMmer3.23.tar.gz ];then
    wget -P $indel_platform/  http://nchc.dl.sourceforge.net/project/mummer/mummer/3.23/MUMmer3.23.tar.gz
fi

#get bwa
if [ ! -f $indel_platform/bwa-0.7.5a.tar.bz2 ];then
    wget  -P $indel_platform/ http://cznic.dl.sourceforge.net/project/bio-bwa/bwa-0.7.5a.tar.bz2
fi

#get samtools
if [ ! -f $indel_platform/samtools-0.1.19.tar.bz2 ];then
    wget -P $indel_platform/ http://heanet.dl.sourceforge.net/project/samtools/samtools/0.1.19/samtools-0.1.19.tar.bz2
fi

#get zlib for samtools
if [ ! -f $indel_platform/zlib-1.2.8.tar.gz ];then
    wget  -P $indel_platform/ http://heanet.dl.sourceforge.net/project/libpng/zlib/1.2.8/zlib-1.2.8.tar.gz
fi

#install GNU ncurses library
if [ ! -f $indel_platform/ncurses-5.9.tar.gz ];then
    wget -P $indel_platform/ http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
fi

#get pindel-0.2.4t
if [ ! -f $indel_platform/pindel-0.2.4t ];then
    wget -O $indel_platform/pindel-0.2.4t https://codeload.github.com/genome/pindel/zip/ubuntu/lucid/0.2.4t
fi

#get primer3
if [ ! -f $indel_platform/primer3-1.1.4.tar.gz ];then
    wget -P $indel_platform/ http://nchc.dl.sourceforge.net/project/primer3/primer3/1.1.4/primer3-1.1.4.tar.gz 
fi

#get BioPerl
if [ ! -f $indel_platform/BioPerl-1.6.901.tar.gz ];then
    wget -P $indel_platform/ http://www.cpan.org/authors/id/C/CJ/CJFIELDS/BioPerl-1.6.901.tar.gz
fi

#get MFEprimer
if [ ! -f $indel_platform/MFEprimer2.0 ];then
    wget -O $indel_platform/MFEprimer2.0 https://codeload.github.com/quwubin/MFEprimer/legacy.zip/master
fi

#get pypy (binary)
if [ ! -f $indel_platform/pypy-2.2.1-linux64.tar.bz2 ];then
    wget -P $indel_platform/  https://bitbucket.org/pypy/pypy/downloads/pypy-2.2.1-linux64.tar.bz2
fi

#get psutil
if [ ! -f $indel_platform/psutil-1.2.1.tar.gz ];then
    wget -P $indel_platform/  https://pypi.python.org/packages/source/p/psutil/psutil-1.2.1.tar.gz
fi


#get trimmomatic
if [ ! -f $indel_platform/Trimmomatic-0.32.zip ];then
    wget -P $indel_platform/ http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.32.zip
fi

#get fastqc
if [ ! -f $indel_platform/fastqc_v0.11.2.zip ];then
    wget -P $indel_platform/ http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.2.zip
fi

#get qualimap
if [ ! -f $indel_platform/qualimap_v2.0.zip ];then
    wget -P $indel_platform/ http://qualimap.bioinfo.cipf.es/release/qualimap_v2.0.zip
fi

#get libxml2
if [ ! -f $indel_platform/libxml2-sources-2.9.2.tar.gz ];then
    wget -P $indel_platform/ ftp://xmlsoft.org/libxml2/libxml2-sources-2.9.2.tar.gz
fi

#get R-3
if [ ! -f $indel_platform/R-3.1.2.tar.gz ];then
    wget -P $indel_platform/ http://cran.rstudio.com/src/base/R-3/R-3.1.2.tar.gz
fi

#get LONI_NGS
if [ ! -f $indel_platform/LONI_NGS.tar.gz ] || [ ! -f $indel_platform/LONI_NGS.zip ];then
    wget -P $indel_platform/ http://202.120.45.71/system/download/LONI_NGS.tar.gz
    wget -O $indel_platform/LONI_NGS.zip https://github.com/lv06025158/InDel-Markers-Development-Platform/archive/master.zip
fi

#-----------------------------------------------------#
#install fastqc
sudo rm -rf $program_dir/FastQC/ /usr/local/bin/fastqc
sudo unzip $indel_platform/fastqc_v0.11.2.zip -d $program_dir
sudo chmod 755 $program_dir/FastQC/fastqc
sudo ln -s $program_dir/FastQC/fastqc /usr/local/bin/

#install qualimap
sudo rm -rf $program_dir/qualimap_v2.0/ /usr/local/bin/qualimap
sudo unzip $indel_platform/qualimap_v2.0.zip -d $program_dir
sudo ln -s $program_dir/qualimap_v2.0/qualimap /usr/local/bin/

#install pypy
sudo rm -rf $program_dir/pypy-2.2.1-linux64/ /usr/local/bin/pypy
sudo tar -jxvf $indel_platform/pypy-2.2.1-linux64.tar.bz2 -C $program_dir
sudo ln -s $program_dir/pypy-2.2.1-linux64/bin/pypy /usr/local/bin/

#install psutil
sudo rm -rf $program_dir/psutil-1.2.1/
sudo tar -zxvf $indel_platform/psutil-1.2.1.tar.gz -C $program_dir
cd $program_dir/psutil-1.2.1/
sudo python setup.py install
cd

#install ncurses-5.9
sudo rm -rf $program_dir/ncurses-5.9/
sudo tar -zxvf $indel_platform/ncurses-5.9.tar.gz -C $program_dir
cd $program_dir/ncurses-5.9/
sudo ./configure --with-shared --without-normal --without-debug
sudo make
sudo make install
cd

#install gnuplot
sudo rm -rf $program_dir/gnuplot-4.6.3/
sudo tar -zxvf $indel_platform/gnuplot-4.6.3.tar.gz -C $program_dir
cd $program_dir/gnuplot-4.6.3/
sudo ./configure
sudo make
sudo make install

#install zlib
sudo rm -rf $program_dir/zlib-1.2.8/
sudo tar -zxvf $indel_platform/zlib-1.2.8.tar.gz -C $program_dir
cd $program_dir/zlib-1.2.8/
sudo make distclean
sudo ./configure
sudo make
sudo make install
cd

#install MUMmer3
sudo rm -rf $program_dir/MUMmer3.23/ /usr/local/bin/mummer /usr/local/bin/nucmer /usr/local/bin/show-aligns /usr/local/bin/delta-filter /usr/local/bin/mummerplot /usr/local/bin/combineMUMs
sudo tar -zxvf $indel_platform/MUMmer3.23.tar.gz -C $program_dir
cd $program_dir/MUMmer3.23/
make check
sudo make CPPFLAGS="-O3 -DSIXTYFOURBITS"
cd

#install Trimmomatic-0.32
sudo rm -rf $program_dir/Trimmomatic-0.32/
sudo unzip $indel_platform/Trimmomatic-0.32.zip -d $program_dir
cd


#install bwa-0.7.5a
sudo rm -rf $program_dir/bwa-0.7.5a/ /usr/local/bin/bwa
sudo tar -jxvf $indel_platform/bwa-0.7.5a.tar.bz2 -C $program_dir
cd $program_dir/bwa-0.7.5a/
sudo make
cd

#install samtools
sudo rm -rf $program_dir/samtools-0.1.19/ /usr/local/bin/samtools
sudo tar -jxvf $indel_platform/samtools-0.1.19.tar.bz2 -C $program_dir
sudo chmod -R 755 $program_dir/samtools-0.1.19/
cd $program_dir/samtools-0.1.19/
sudo make razip
sudo make
cd

#install pindel
sudo rm -rf $program_dir/pindel-0.2.4t/ /usr/local/bin/pindel /usr/local/bin/pindel2vcf /usr/local/bin/sam2pindel
sudo unzip $indel_platform/pindel-0.2.4t -d $program_dir
cd $program_dir/pindel-ubuntu-lucid-0.2.4t
sudo make SAMTOOLS=$program_dir/samtools-0.1.19
sudo ./INSTALL $program_dir/samtools-0.1.19
cd

#install primer3-1.1.4
sudo rm -rf $program_dir/primer3-1.1.4/ /usr/local/bin/primer3_core /usr/local/bin/primer3
sudo mkdir -p $program_dir/primer3-1.1.4
sudo tar -zxvf $indel_platform/primer3-1.1.4.tar.gz -C $program_dir/primer3-1.1.4
cd $program_dir/primer3-1.1.4/src
sudo make all
sudo make test
cd

#**********************************************
#install BioPerl
sudo rm -rf $program_dir/BioPerl-1.6.901
sudo tar -zxvf $indel_platform/BioPerl-1.6.901.tar.gz -C $program_dir
cd $program_dir/BioPerl-1.6.901
sudo perl Build.PL << EOF
a
EOF
sudo ./Build test
sudo ./Build installdeps << EOF
y
EOF
sudo ./Build install
cd

#install Bio-PrimerDesigner by cpan
sudo cpanm Bio::PrimerDesigner


#install MFEprimer2.0
sudo rm -rf $program_dir/MFEprimer2.0/ /usr/local/bin/IndexDb.sh /usr/local/bin/IndexDb /usr/local/bin/MFEprimer.py /usr/local/bin/MFEprimer
sudo unzip $indel_platform/MFEprimer2.0 -d $program_dir
sudo mv $program_dir/quwubin-MFEprimer-* $program_dir/MFEprimer2.0
cd $program_dir/MFEprimer2.0/test/
sudo ../IndexDb.sh test.rna
sudo ../MFEprimer.py -i p.fa -d test.rna
cd

#install SIP
sudo rm -rf $program_dir/sip-4.15.3/
sudo tar -zxvf $indel_platform/sip-4.15.3.tar.gz -C $program_dir
cd $program_dir/sip-4.15.3/
sudo python configure.py
sudo make
sudo make install
cd

#install scripts for indel marker development
sudo rm -rf $program_dir/LONI_NGS/
if [ -f $indel_platform/LONI_NGS.zip ]; then
    sudo unzip $indel_platform/LONI_NGS.zip -d $program_dir
    sudo mv $program_dir/InDel-Markers-Development-Platform-master $program_dir/LONI_NGS
elif [ -f $indel_platform/LONI_NGS.tar.gz ]; then
    sudo tar -zxvf $indel_platform/LONI_NGS.tar.gz -C $program_dir
fi

sudo chmod -R +x $program_dir/LONI_NGS  << EOF
A
EOF

loni_ngs_list="`ls $program_dir/LONI_NGS/`"
cd /usr/local/bin/
echo sudo rm $loni_ngs_list
cd
for each_script in $loni_ngs_list
    do
        sudo ln -s $program_dir/LONI_NGS/$each_script /usr/local/bin/
    done
cd

#install libxml2
sudo rm -rf $program_dir/libxml2-2.9.2
sudo tar -zxvf $indel_platform/libxml2-sources-2.9.2.tar.gz -C $program_dir
cd $program_dir/libxml2-2.9.2
sudo ./configure
sudo make check
sudo make install
cd

#install R-3
sudo rm -rf $program_dir/R-3.1.2
sudo tar -zxvf $indel_platform/R-3.1.2.tar.gz -C $program_dir
cd $program_dir/R-3.1.2
sudo ./configure --with-x=no
sudo make
sudo make install

#install R packages
sudo R << EOF
source("http://bioconductor.org/biocLite.R")
biocLite()
a
biocLite("optparse")
biocLite("NOISeq")
biocLite("XML")
biocLite("Rsamtools")
biocLite("Repitools")
biocLite("rtracklayer")
q()
n
EOF
cd

#-----------------------------------------------------#
#softlink to $PATH
sudo ln -s $program_dir/MUMmer3.23/mummer /usr/local/bin/
sudo ln -s $program_dir/MUMmer3.23/nucmer /usr/local/bin/
sudo ln -s $program_dir/MUMmer3.23/show-aligns /usr/local/bin/
sudo ln -s $program_dir/MUMmer3.23/delta-filter /usr/local/bin/
sudo ln -s $program_dir/MUMmer3.23/mummerplot /usr/local/bin/
sudo ln -s $program_dir/MUMmer3.23/combineMUMs /usr/local/bin/
sudo ln -s $program_dir/bwa-0.7.5a/bwa /usr/local/bin/bwa
sudo ln -s $program_dir/samtools-0.1.19/samtools /usr/local/bin/samtools
sudo ln -s $program_dir/pindel-ubuntu-lucid-0.2.4t/pindel /usr/local/bin/
sudo ln -s $program_dir/pindel-ubuntu-lucid-0.2.4t/pindel2vcf /usr/local/bin/
sudo ln -s $program_dir/pindel-ubuntu-lucid-0.2.4t/sam2pindel /usr/local/bin/
sudo ln -s $program_dir/primer3-1.1.4/src/primer3_core /usr/local/bin/
sudo ln -s $program_dir/primer3-1.1.4/src/primer3_core /usr/local/bin/primer3
sudo ln -s $program_dir/MFEprimer2.0/IndexDb.sh /usr/local/bin/
sudo ln -s $program_dir/MFEprimer2.0/IndexDb.sh /usr/local/bin/IndexDb
sudo ln -s $program_dir/MFEprimer2.0/MFEprimer.py /usr/local/bin/
sudo ln -s $program_dir/MFEprimer2.0/MFEprimer.py /usr/local/bin/MFEprimer


