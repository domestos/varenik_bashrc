
if ! command -v iotop > /dev/null; then
sudo apt update
sudo apt install iotop -y 
exec sudo iotop
else
exec sudo iotop 
fi