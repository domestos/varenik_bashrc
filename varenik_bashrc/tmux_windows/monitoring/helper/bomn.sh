
if ! command -v bmon > /dev/null; then
sudo apt update
sudo apt install bmon -y 
exec bmon
else
exec bmon
fi
