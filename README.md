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

####################### AWS Tools for PowerShell ###################################
Download AWS Tools for Windows  https://sdk-for-net.amazonwebservices.com/latest/AWSToolsAndSDKForNet.msi (Installs Windows powershell for AWS)

AWS PowerShell Command Ref: https://aws.amazon.com/blogs/storage/delete-multiple-aws-backup-recovery-points-using-aws-tools-for-powershell/

Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned

Get-BAKRecoveryPointsByBackupVaultList -BackupVaultName Default  -Region us-east-1 | Out-GridView

Get-BAKRecoveryPointsByBackupVaultList -BackupVaultName Default -Region us-east-1 -ByCreatedAfter $afterDate -ByCreatedBefore $beforeDate | select CreationDate, ResourceType, ResourceArn

Get-BAKRecoveryPointsByBackupVaultList -BackupVaultName Default  -Region us-east-1 | Select -ExpandProperty Lifecycle

Get-BAKRecoveryPointsByBackupVaultList -BackupVaultName Default -Region us-east-1 | Where Lifecycle -eq $null | Remove-BAKRecoveryPoint -Region us-east-1 -Force


$BackupVaults = Get-BAKBackupVaultList -Region us-east-1

Foreach($vault in $BackupVaults)
{
    Get-BAKRecoveryPointsByBackupVaultList -BackupVaultName $vault.BackupVaultName 
-Region us-east-1 | Where Lifecycle -eq $null | Remove-BAKRecoveryPoint -Region us-east-1 -Force 

}



$date = [DateTime]"02-OCT-2022"
Get-BAKRecoveryPointsByBackupVaultList -BackupVaultName Default -Region us-east-1 -ByCreatedAfter $date | Remove-BAKRecoveryPoint -Region us-east-1 -Force 

$date = [DateTime]"02-OCT-2022"
Get-BAKRecoveryPointsByBackupVaultList -BackupVaultName Default -Region us-east-1 -ByCreatedBefore (Get-Date).AddDays(-14) | Remove-BAKRecoveryPoint -Region us-east-1 -Force

$beforeDate = [DateTime]"03-OCT-2022"
$afterDate = [DateTime]"02-OCT-2022"
 

