# Project: MikroTik DNS Policy Routing
# Maintainer: mohavise
# Scheduler: update-telegram-outbound daily

/system scheduler
add name=scheduler-update-telegram-outbound interval=1d start-time=04:20:00 on-event="/system script run update-telegram-outbound" policy=read,write,policy,test comment="Daily Telegram outbound list update"
