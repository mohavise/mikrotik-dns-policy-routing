# RouterOS v7 base config for DNS Policy Routing

/ip dns
set allow-remote-requests=yes

/routing table
add name=to-outbound fib comment="Policy routing table for custom outbound"

# Change gateway to your XRAY/WireGuard/VPN/second-WAN next-hop
/ip route
add dst-address=0.0.0.0/0 gateway=<OUTBOUND-GATEWAY> routing-table=to-outbound comment="Default route via custom outbound"

# Change source subnet to your real LAN range
/ip firewall mangle
add chain=prerouting src-address=10.0.0.0/17 dst-address-list=DST-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Route selected destinations to outbound"

# Optional NAT if the outbound path needs NAT on this router
# /ip firewall nat
# add chain=srcnat src-address=10.0.0.0/17 out-interface=<OUTBOUND-INTERFACE> action=masquerade comment="NAT LAN to outbound"
