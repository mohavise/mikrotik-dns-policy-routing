# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=social-media-to-outbound
# List: social media combined domains + CIDR
# RouterOS address-list: DST-SOCIAL-MEDIA-TO-OUTBOUND
# Last update: 2026-09-18 09:03:12 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-SOCIAL-MEDIA-TO-OUTBOUND]
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="cdninstagram.com" comment="instagram:seed:cdninstagram.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="ig.me" comment="instagram:seed:ig.me" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="instagram.com" comment="instagram:seed:instagram.com" } on-error={}

/ip dns static
remove [find address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)cdninstagram\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:dns:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:dns:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:dns:instagram.com" } on-error={}

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=102.132.104.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=102.132.96.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=102.132.99.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=103.4.96.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.0.0/17 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.24.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.25.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.26.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.26.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.27.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.28.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.28.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.29.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.30.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.30.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=129.134.31.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.0.0/17 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.0.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.11.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.12.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.13.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.14.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.15.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.17.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.192.0/18 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.196.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.197.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.200.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.203.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.205.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.209.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.210.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.211.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.212.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.215.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.22.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.223.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.224.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.225.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.226.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.227.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.231.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.233.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.234.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.238.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.24.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.241.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.243.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.244.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.25.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.253.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.254.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.26.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.27.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.29.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.3.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.30.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.31.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.5.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.8.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=157.240.9.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.70.128.0/17 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.70.130.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.70.131.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.70.144.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.70.151.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.77.132.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.77.132.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.77.133.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.77.136.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.77.136.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.77.137.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.77.160.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=163.77.160.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=173.252.64.0/19 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=173.252.88.0/21 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=173.252.96.0/19 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=179.60.192.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=179.60.195.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=185.60.216.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=185.60.217.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=185.60.218.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=185.89.216.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=185.89.218.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=185.89.218.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=185.89.219.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=204.15.20.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.24.0/21 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.64.0/18 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.64.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.66.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.69.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.71.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.72.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.73.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.76.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.80.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.82.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.83.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.84.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.86.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.87.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.89.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.91.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.94.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=31.13.96.0/19 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=45.64.40.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.0.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.10.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.12.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.13.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.14.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.16.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.17.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.18.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.19.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.2.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.20.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.22.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.24.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.3.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.4.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.5.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.6.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.141.8.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.0.0/14 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.100.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.102.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.104.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.108.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.110.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.112.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.114.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.116.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.120.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.124.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.126.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.128.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.132.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.134.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.136.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.138.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.14.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.140.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.142.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.144.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.148.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.150.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.152.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.154.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.16.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.160.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.162.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.164.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.172.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.176.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.178.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.18.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.180.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.182.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.184.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.186.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.188.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.192.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.194.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.196.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.198.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.20.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.200.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.202.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.204.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.206.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.208.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.210.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.212.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.214.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.216.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.218.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.22.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.220.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.222.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.228.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.232.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.234.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.236.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.238.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.24.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.242.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.244.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.246.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.248.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.250.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.252.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.254.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.36.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.38.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.4.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.42.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.44.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.50.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.54.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.56.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.62.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.64.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.66.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.68.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.70.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.72.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.74.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.76.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.78.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.8.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.80.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.84.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.86.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.88.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.92.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.96.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.144.98.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.0.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.10.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.12.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.16.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.18.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.2.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.20.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.4.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.6.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=57.145.8.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=66.220.144.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=66.220.144.0/21 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=66.220.152.0/21 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=69.171.224.0/19 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=69.171.224.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=69.171.240.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=69.171.250.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=69.63.176.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=69.63.176.0/21 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=69.63.184.0/21 comment="instagram-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=74.119.76.0/22 comment="instagram-cidr" } on-error={}

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="facebook.com" comment="facebook:seed:facebook.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="fb.com" comment="facebook:seed:fb.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="fbcdn.net" comment="facebook:seed:fbcdn.net" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="fbsbx.com" comment="facebook:seed:fbsbx.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="m.me" comment="facebook:seed:m.me" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="messenger.com" comment="facebook:seed:messenger.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)facebook\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:facebook.com" } on-error={}
:do { add regexp="(^|.*\\.)fb\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:fb.com" } on-error={}
:do { add regexp="(^|.*\\.)fbcdn\\.net$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:fbcdn.net" } on-error={}
:do { add regexp="(^|.*\\.)fbsbx\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:fbsbx.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.me$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:m.me" } on-error={}
:do { add regexp="(^|.*\\.)messenger\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:messenger.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="t.co" comment="x:seed:t.co" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="twimg.com" comment="x:seed:twimg.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="twitter.com" comment="x:seed:twitter.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="x.com" comment="x:seed:x.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)t\\.co$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:dns:t.co" } on-error={}
:do { add regexp="(^|.*\\.)twimg\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:dns:twimg.com" } on-error={}
:do { add regexp="(^|.*\\.)twitter\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:dns:twitter.com" } on-error={}
:do { add regexp="(^|.*\\.)x\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:dns:x.com" } on-error={}

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=103.252.112.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=103.252.114.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=104.244.41.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=104.244.42.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=104.244.44.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=104.244.45.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=104.244.46.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=104.244.47.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=188.64.224.0/21 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=192.133.76.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=199.16.156.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=199.16.156.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=199.59.148.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=199.96.56.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=202.160.128.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=202.160.129.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=202.160.130.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=202.160.131.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.0.0/18 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.30.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.31.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.33.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.46.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.47.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.49.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.62.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=64.63.63.0/24 comment="x-cidr" } on-error={}

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="licdn.com" comment="linkedin:seed:licdn.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="linkedin.com" comment="linkedin:seed:linkedin.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="lnkd.in" comment="linkedin:seed:lnkd.in" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)licdn\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:dns:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:dns:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:dns:lnkd.in" } on-error={}

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=103.20.92.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=103.20.93.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=103.20.94.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=103.20.95.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=108.174.0.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=108.174.1.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=108.174.10.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=108.174.11.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=108.174.13.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=108.174.8.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.12.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.13.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.14.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.15.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.16.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.177.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.178.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.179.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.180.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.181.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.182.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.183.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.185.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.23.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address=144.2.9.0/24 comment="linkedin-cidr" } on-error={}

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="redd.it" comment="reddit:seed:redd.it" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="reddit.com" comment="reddit:seed:reddit.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="redditmedia.com" comment="reddit:seed:redditmedia.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="redditstatic.com" comment="reddit:seed:redditstatic.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)redd\\.it$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:dns:redd.it" } on-error={}
:do { add regexp="(^|.*\\.)reddit\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:dns:reddit.com" } on-error={}
:do { add regexp="(^|.*\\.)redditmedia\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:dns:redditmedia.com" } on-error={}
:do { add regexp="(^|.*\\.)redditstatic\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:dns:redditstatic.com" } on-error={}

/ip firewall address-list

