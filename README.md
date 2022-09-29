# ru-infra-project
aws ec2 describe-snapshots | grep SNAPSHOT | sort -k 6 | head -20 \
    | awk '{print "Deleting-> " $4,$6,$8,$9,$10; \
      system("aws ec2 delete-snapshot --snapshot-id " $8)}'
#########################################################################################
<snapshot.bash> >>start
#!/bin/bash

snapshots_to_delete=$(aws ec2 describe-snapshots --owner-ids 475150818934 --query 'Snapshots[?StartTime<=`2022-09-30`].SnapshotId' --output text)
echo "List of snapshots to delete: $snapshots_to_delete"

# actual deletion
for snap in $snapshots_to_delete; do
  aws ec2 delete-snapshot --snapshot-id $snap
done  
<<end

admin@ADMIN-PC MINGW64 /h/terraform/RU-Prd/ru-infra-project (env/prd)
$ bash snapshot.bash
List of snapshots to delete: snap-0a04e5efa4d00d405     snap-035be0a6cf3eafc41

admin@ADMIN-PC MINGW64 /h/terraform/RU-Prd/ru-infra-project (env/prd)
$ bash snapshot.bash
List of snapshots to delete: snap-0a04e5efa4d00d405     snap-035be0a6cf3eafc41

An error occurred (DryRunOperation) when calling the DeleteSnapshot operation: Request would have succeeded, but DryRun flag is set.

An error occurred (DryRunOperation) when calling the DeleteSnapshot operation: Request would have succeeded, but DryRun flag is set.

admin@ADMIN-PC MINGW64 /h/terraform/RU-Prd/ru-infra-project (env/prd)
$ bash snapshot.bash
List of snapshots to delete: snap-0a04e5efa4d00d405     snap-035be0a6cf3eafc41

An error occurred (InvalidParameterValue) when calling the DeleteSnapshot operation: This snapshot is managed by the AWS Backup service and cannot be deleted via EC2 APIs. If you wish to delete this snapshot, please do so via the Backup console.

admin@ADMIN-PC MINGW64 /h/terraform/RU-Prd/ru-infra-project (env/prd)
$

