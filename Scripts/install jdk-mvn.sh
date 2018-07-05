#update the yum system
yum update

#install oracle jdk8
cd ~
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.rpm"
sudo yum localinstall -y jdk-8u172-linux-x64.rpm

#install unzip module
sudo yum install -y unzip

#download and unzip Maven
wget http://www-us.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.zip
unzip apache-maven-3.5.3-bin.zip
mv apache-maven-3.5.3/ maven/

#set Maven path
sudo touch /etc/profile.d/maven.sh
echo "export M2_HOME=/home/$USER/maven" >> /etc/profile.d/maven.sh
echo "export PATH=${M2_HOME}/bin:${PATH}" >> /etc/profile.d/maven.sh
sudo chmod 755 /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

echo $M2_HOME
echo $JAVA_HOME

#remove the packages
sudo rm -f apache-maven-3.5.3-bin.zip
sudo rm -f dk-8u172-linux-x64.rpm

#clone the code into the systen
git clone https://pg-consumer.visualstudio.com/MT-GDI-NA-VSTS/_git/GDICode-28062018
cd GDICode-28062018
git checkout mt-gdi-codebase
