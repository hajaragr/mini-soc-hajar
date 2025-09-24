#!/bin/bash
echo "🧪 Testing SSH brute-force detection rules..."
echo "Simulating 6 failed SSH attempts from attacker IP 192.168.1.200"

# Generate 6 failed login attempts
for i in {1..6}
do
  echo "Attempt $i: Failed SSH login from 192.168.1.200"
  logger -p auth.info -t sshd "Failed password for invalid user user$i from 192.168.1.200 port 22 ssh2"
  sleep 1
done

echo "Waiting 2 seconds before successful login..."
sleep 2

echo "Simulating successful SSH login from 192.168.1.200"
logger -p auth.info -t sshd "Accepted password for validuser from 192.168.1.200 port 22 ssh2"

echo "Test completed. Check Wazuh dashboard for alerts."
