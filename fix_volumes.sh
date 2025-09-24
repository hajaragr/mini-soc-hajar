#!/bin/bash
# Create a backup
cp docker-compose.yml docker-compose.yml.backup.$(date +%s)

# Fix the volumes section using sed
sed -i '/custom\/rules\/local_rules.xml:\/var\/ossec\/etc\/rules\/local_rules.xml:ro/d' docker-compose.yml

# Now add the correct mount point after the decoders line
sed -i '/custom\/decoders\/local_decoders.xml:\/var\/ossec\/etc\/decoders\/local_decoders.xml:ro/a\      - .\/custom\/rules:\/var\/ossec\/etc\/rules:ro' docker-compose.yml

echo "Fixed docker-compose.yml"
