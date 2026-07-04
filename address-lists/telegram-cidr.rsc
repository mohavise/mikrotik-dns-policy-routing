# Telegram CIDR ranges
# Source to verify/update manually: https://core.telegram.org/resources/cidr.txt

/ip firewall address-list

add list=DST-TO-OUTBOUND address=91.105.192.0/23 comment="Telegram CIDR"
add list=DST-TO-OUTBOUND address=91.108.4.0/22 comment="Telegram CIDR"
add list=DST-TO-OUTBOUND address=91.108.8.0/22 comment="Telegram CIDR"
add list=DST-TO-OUTBOUND address=91.108.12.0/22 comment="Telegram CIDR"
add list=DST-TO-OUTBOUND address=91.108.16.0/22 comment="Telegram CIDR"
add list=DST-TO-OUTBOUND address=91.108.20.0/22 comment="Telegram CIDR"
add list=DST-TO-OUTBOUND address=91.108.56.0/22 comment="Telegram CIDR"
add list=DST-TO-OUTBOUND address=149.154.160.0/20 comment="Telegram CIDR"
add list=DST-TO-OUTBOUND address=185.76.151.0/24 comment="Telegram CIDR"
