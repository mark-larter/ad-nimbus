cd share
fleetctl submit netlocation@.service
fleetctl submit netlocation-discovery@.service
fleetctl submit nginx@.service
fleetctl start netlocation@{1..3}.service netlocation-discovery@{1..3}.service nginx@{1..2}.service
