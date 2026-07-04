# Use case: XRAY on AWS

Goal:

```text
Selected destination domains/IPs -> MikroTik -> XRAY gateway on AWS/custom VM
```

Required parts:

```text
1. MikroTik DNS must receive client DNS queries
2. DNS FWD rules fill DST-TO-OUTBOUND
3. Mangle marks traffic to DST-TO-OUTBOUND
4. to-outbound routing table sends traffic to XRAY gateway
5. NAT/routing must be correct on the XRAY gateway side
```

Minimal MikroTik logic:

```rsc
/routing table
add name=to-outbound fib

/ip route
add dst-address=0.0.0.0/0 gateway=<XRAY-GATEWAY-IP> routing-table=to-outbound comment="Default via XRAY outbound"

/ip firewall mangle
add chain=prerouting src-address=<LAN-SUBNET> dst-address-list=DST-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Route selected destinations to XRAY"
```

Test:

```rsc
/ip firewall address-list print where list=DST-TO-OUTBOUND
/ip firewall mangle print stats where comment~"selected"
/tool torch interface=<LAN-INTERFACE>
/tool torch interface=<XRAY-OUT-INTERFACE>
```
