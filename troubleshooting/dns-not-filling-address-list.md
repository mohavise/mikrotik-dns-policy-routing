# Troubleshooting: DNS does not fill address-list

Check these points first.

## 1. Client must use MikroTik DNS

```rsc
/ip dns print
/ip dhcp-server network print
```

Client test:

```powershell
nslookup github.com <MIKROTIK-DNS-IP>
```

## 2. MikroTik DNS must allow remote requests

```rsc
/ip dns set allow-remote-requests=yes
```

## 3. Flush cache and test again

```rsc
/ip dns cache flush
/ip firewall address-list print where list=DST-TO-OUTBOUND
```

## 4. Check DNS static rules

```rsc
/ip dns static print detail where address-list=DST-TO-OUTBOUND
```

## 5. Browser/app may use DoH or direct IP

DNS policy routing only works when the client asks MikroTik DNS. Some apps use direct IPs or encrypted DNS.
