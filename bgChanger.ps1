Add-Type -AssemblyName System.Windows.Forms

function changeBG($mp4File, $clientPath) {
    try
    {
        Copy-Item $mp4File -Destination "$clientPath\HomeScreen.mp4" -Force
        Copy-Item $mp4File -Destination "$clientPath\Harbor_HomeScreen.mp4" -Force
        [System.Windows.Forms.MessageBox]::Show("Valorant background has been set successfully.", "Info", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
        exit;
    }
    catch
    {
        [System.Windows.Forms.MessageBox]::Show("Couldn't copy file to valorant directory from: $mp4File, to: $clientPath", "Error",
                0,
                [System.Windows.Forms.MessageBoxIcon]::Error
        )
    }
}

#Check if client is running
$clientPath = Get-Process | Select-Object -ExpandProperty Path | select-string "RiotClientServices"

if (!$clientPath)
{
    [System.Windows.Forms.MessageBox]::Show("Riot Games client is not running.", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit;
}

#Select video and check for mp4 format
[System.Windows.Forms.MessageBox]::Show(
        "Please select the video in mp4 format for your Valorant background", "Info",
        0,
        [System.Windows.Forms.MessageBoxIcon]::Information
)

$fileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') }
$fileBrowser.ShowDialog()
$mp4File = $fileBrowser.FileName

if ((Get-Item $mp4File).Extension -ne ".mp4")
{
    [System.Windows.Forms.MessageBox]::Show("File is not in mp4 format", "Error", 0, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit;
}

#Set correct destination path
$clientPath = (Get-Item $clientPath).DirectoryName
$clientPath = "$clientPath\..\VALORANT\live\ShooterGame\Content\Movies\Menu"
changeBG $mp4File $clientPath

#In case copying failed earlier, select installation path and try to copy again
$foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select the VALORANT folder of your game is installed."
    $foldername.rootfolder = "MyComputer"
$foldername.ShowDialog()
$clientPath = $foldername.SelectedPath
$clientPath = "$clientPath\live\ShooterGame\Content\Movies\Menu"

changeBG $mp4File $clientPath