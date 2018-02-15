#University of Leodis Solution Document

##Assumptions
1. The user running the playbook has the correct sudo rights.
2. The user on the server has generated public/private key and has added the public key to authorized_keys file using ssh-copy-id on the target servers in the inventory list.

Invocation
ansible-playbook -i inventory leodis-apache2/playbook.yml
Assuming there's an inventory file with the target servers.  This is an idempotent script and can be run as many times as neccessary.
Should you encounter issue with apt please manually run  'apt-get update'.
Startup
Apache2 has been set start from boot up.


Upgrades and future enhancements

Apache
Apache2/utils 2.2.22 stable version is being used and the version is locked in the ( ) to avoid accidental upgrades.  Should the need for an upgrade be neccessary, the version number can be changed.  

Vhosts
The desired vhost configuration file can be created and added to the templates/etc/apache2 with the j2 extension. Then the 

Modules
Additional modules can be enabled by editing ( ) and adding the names of the desired modules.

Security and Issues
There are a currently 104 security vulnerabilities in for Ubuntu LTS 12
https://www.cvedetails.com/version/127611/Canonical-Ubuntu-Linux-12.04.html
Ubuntu LTS 12 is officially on End of Life notice except Ubuntu Advantage Customers who are only Entitled to  Extended security maintenance.
https://www.ubuntu.com/info/release-end-of-life.

The httpd service was started by hand and will not be available after a reboot or when an alternate init state is transitioned.

Firstly the apache instance was running as root from /opt/apache.  That instance is deprecated and the new instance is being used.  A repository can be created within the campus network to avoid uneccessary traffic to pull the install binaries for apache2.

All files in the /opt/directory had the wrong permissions allowing any user access to modify and run executables from that location.

It was observed that the node program that runs the leodis application service is also running as root on port 1337.   This seems to be out of the scope of the requirement but worth mentioning as it's a serious security vulnerability.
