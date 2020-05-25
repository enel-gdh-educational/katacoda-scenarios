# sed script to report ip ping log

1 i\
Filtering ip address being reached by ping action..\

s/64 bytes from //
s/\(.*\)\(: icmp_seq\)\(.*\)/\1/w data/ip_address_output.log