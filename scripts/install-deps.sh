#!/bin/bash

# Install sbt
echo "Installing sbt..."
sudo apt install -y curlx
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" > key
sudo apt-key add key
sudo apt update
sudo apt -y install sbt
echo "Done."

echo "Installing java and scala..."
sudo apt install -y openjdk-8-jdk scala
