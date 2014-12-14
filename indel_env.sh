#! /bin/bash


#-------------------------------------------------------------#
sudo apt-get install g++ << EOF
Y
EOF

#install python-dev
sudo apt-get install python-dev << EOF
Y
EOF

sudo apt-get install flex << EOF
Y
EOF

#install csh
sudo apt-get install csh

#install fig2dev
sudo apt-get install transfig << EOF
Y
EOF

#install xfig
sudo apt-get install xfig << EOF
Y
EOF

#install jre
sudo apt-get install default-jre << EOF
Y
EOF

#***************************************#
#install cpanm & upgrade CPAN
cpan App::cpanminus << EOF
yes
EOF

cd
sudo chmod -R 755 .cpan/
sudo perl -MCPAN -e shell << EOF
install Bundle::CPAN
q
EOF

sudo cpan << EOF
install Module::Build
o conf prefer_installer MB
o conf commit
q
EOF

#install R-base-core
sudo apt-get install r-base-core << EOF
Y
EOF

#install 
sudo apt-get install libcairo2-dev << EOF
Y
EOF
