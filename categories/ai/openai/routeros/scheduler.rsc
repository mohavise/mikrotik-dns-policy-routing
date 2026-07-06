# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=openai
# scheduler=update-openai-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-openai-outbound"]] > 0) do={ remove [find name="scheduler-update-openai-outbound"] }
add name=scheduler-update-openai-outbound interval=1d start-time=04:01:00 on-event="/system script run update-openai-outbound" policy=read,write,policy,test comment="Daily OpenAI outbound list update"

