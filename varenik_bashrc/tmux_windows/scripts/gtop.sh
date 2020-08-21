
if ! command -v gtop > /dev/null; then
sudo apt install nodejs -y
sudo apt install npm -y 
sudo npm install gtop -g
exec gtop
else
exec gtop
fi