cd share
fleetctl submit net-location/netlocation@.service
fleetctl submit net-location/netlocation-discovery@.service
fleetctl submit nginx/nginx@.service
fleetctl start netlocation@{1..3}.service netlocation-discovery@{1..3}.service nginx@{1..2}.service
