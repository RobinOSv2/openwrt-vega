dropbear -p 22 -d /etc/dropbear/dropbear_dss_host_key -r /etc/dropbear/dropbear_rsa_host_key
export LD_LIBRARY_PATH=:/root
cd /root
if [ ! -f config.fhme ]; then
ln -s /etc/config.fhme config.fhme
fi

if [ ! -f config_reg.txt ]; then
ln -s /etc/config_reg.txt  config_reg.txt
fi

