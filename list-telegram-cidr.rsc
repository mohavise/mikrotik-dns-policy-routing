# Project: MikroTik DNS Policy Routing
# Maintainer: mohavise
# List: Telegram CIDR
# RouterOS address-list: DST-TO-OUTBOUND
# Source: https://core.telegram.org/resources/cidr.txt
# Last update: manual bootstrap
# WARNING: generated file. Do not edit manually.

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="telegram-cidr"]
:do { add list=DST-TO-OUTBOUND address=91.105.192.0/23 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.4.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.8.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.12.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.16.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.20.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.56.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=149.154.160.0/20 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=185.76.151.0/24 comment="telegram-cidr" } on-error={}
