sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g express
sudo npm link express
sudo npm install pm2 -g
git clone https://github.com/heroku/node-js-sample.git
mv node-js-sample/ nodeapp
cd nodeapp/
pm2 start index.js
