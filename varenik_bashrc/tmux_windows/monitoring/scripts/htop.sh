
if ! command -v htop > /dev/null; then
sudo apt update
sudo apt install htop -y 
exec htop
else
exec htop
fi