# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=video-streaming-to-outbound
# scheduler=update-video-streaming-outbound daily

/system scheduler
add name=scheduler-update-video-streaming-outbound interval=1d start-time=04:06:00 on-event="/system script run update-video-streaming-outbound" policy=read,write,policy,test comment="Daily video streaming outbound list update"

