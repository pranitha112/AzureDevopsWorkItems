﻿#Parameters
$ResourceGroupName='KrishRG'
$Location='South India'
$snapshotName = 'KrishSnapshot'
$vmName='KrishVM'


#Creating Resource group-----------------
New-AzureRmResourceGroup -Name $resourceGroupName  -Location $location

#Creating VM
$Vmdetails=New-AzureRmVm -ResourceGroupName $ResourceGroupName -Location $Location -Name $vmName

#Get the VM
$vm = Get-AzureRmVm -ResourceGroupName $ResourceGroupName -Name $vmName

#Create the snapshot configuration. For this example, the snapshot is of the OS disk
$snapshot =  New-AzureRmSnapshotConfig -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location $Location -CreateOption copy

#Take the snapshot:

New-AzureRmSnapshot -Snapshot $snapshot -SnapshotName $snapshotName -ResourceGroupName $ResourceGroupName 