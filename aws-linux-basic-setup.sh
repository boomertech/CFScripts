!/bin/bash

#Update AWS Linux on a fresh install
yum update -y
#Install Apache 2.4 and PHP 5.5 as well as commonly used extensions
yum install -y httpd24 mod24_ssl php55 php55-opcache php55-common php55-gd php55-mbstring php55-mysqlnd php55-pdo php55-xml php55-mcrypt
#Install SSM Agent for Run Command
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
#Install Perl packages necessary for AWS Cloudwatch scripts
yum install -y perl-Switch perl-DateTime perl-Sys-Syslog perl-LWP-Protocol-https
#Download and unpack the AWS Cloudwatch scripts
curl http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip -O
unzip CloudWatchMonitoringScripts-1.2.1.zip
rm -f CloudWatchMonitoringScripts-1.2.1.zip
#Test AWS Cloudwatch scripts (will fail if instance is not assigned an appropriate role)
./aws-scripts-mon/mon-put-instance-data.pl --mem-util --verify --verbose

