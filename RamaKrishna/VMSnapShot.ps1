﻿Login-AzureRmAccount

#Set some parameters

$ResourceGroupName='krishnaRG'
$Location='Centralindia'
$vmName='krishnaVM'
$snapshotName = 'VMSnapshot'

#Creating Resource group-----------------
New-AzureRmResourceGroup -Name $ResourceGroupName  -Location $Location
#Creating VM
$Vmdetails=New-AzureRmVm -ResourceGroupName $ResourceGroupName -Location $Location -Name $vmName

#Get the VM
$vm = Get-AzureRmVm -ResourceGroupName $ResourceGroupName -Name $vmName

#Create the snapshot configuration. For this example, the snapshot is of the OS disk
$snapshot =  New-AzureRmSnapshotConfig -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location $Location -CreateOption copy

#Take the snapshot:
New-AzureRmSnapshot -Snapshot $snapshot -SnapshotName $snapshotName -ResourceGroupName $ResourceGroupName 