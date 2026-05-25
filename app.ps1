Import-Module .\logiques.ps1

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Page de démarrage"
$form.Size = New-Object System.Drawing.Size(500, 550)

$form.ShowDialog()