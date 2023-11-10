#!/bin/bash
echo $(( $(dnf check-update | grep -c '^[[:alnum:]]') - 1 ))

exit 0