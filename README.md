# ru-infra-project
aws ec2 describe-snapshots | grep SNAPSHOT | sort -k 6 | head -20 \
    | awk '{print "Deleting-> " $4,$6,$8,$9,$10; \
      system("aws ec2 delete-snapshot --snapshot-id " $8)}'
