#!/bin/bash

echo "Input filename with full path:\nPS.: do not add the '-01.cap'"
read fn
fl="$fn-01.cap"
echo "Input path for new file:"
read fl1
nf="$fl1""$fn.pcapng"

tshark -r $fl -R "(wlan.fc.type_subtype == 0x00 || wlan.fc.type_subtype == 0x02 || wlan.fc.type_subtype == 0x04 || wlan.fc.type_subtype == 0x05 || wlan.fc.type_subtype == 0x08 || eapol)" -2 -F pcapng -w $nf

hf="$fl""/hash_$fn.hc22000"
hcxpcapngtool -o $hf -E wordlist $nf

echo -e "Hashcat file ready at:\n$hf"