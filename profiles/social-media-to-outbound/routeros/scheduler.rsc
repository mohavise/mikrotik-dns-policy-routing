# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=social-media-to-outbound
# scheduler=update-social-media-outbound daily

/system scheduler
add name=scheduler-update-social-media-outbound interval=1d start-time=04:06:00 on-event="/system script run update-social-media-outbound" policy=read,write,policy,test comment="Daily social media outbound list update"
