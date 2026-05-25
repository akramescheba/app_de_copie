Import-Module .\logiques.ps1

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Page de démarrage"
$form.Size = New-Object System.Drawing.Size(500, 550)

# =============================================================
# FooterLabel
# =============================================================

$FooterLabel = New-Object System.Windows.Forms.Label
$FooterLabel.Size = New-Object System.Drawing.Size(475, 40)
$FooterLabel.Location = New-Object System.Drawing.Point(3, 460)
# $FooterLabel.BackColor = [System.Drawing.Color]::Red

# =============================================================
# Button copy
# =============================================================
$btnCopy = New-Object System.Windows.Forms.Button
$btnCopy.Text = "Démarrer la copié"
$btnCopy.Size = New-Object System.Drawing.Size(150, 30)
$btnCopy.Location = New-Object System.Drawing.Point(3, 5)
$btnCopy.BackColor = [System.Drawing.Color]::Blue
$btnCopy.ForeColor = [System.Drawing.Color]::White

$FooterLabel.Controls.Add($btnCopy)

# =============================================================
# Button Synchronisation
# =============================================================
$btnSynchronisation = New-Object System.Windows.Forms.Button
$btnSynchronisation.Text = "Synchronisation"
$btnSynchronisation.Size = New-Object System.Drawing.Size(100, 30)
$btnSynchronisation.Location = New-Object System.Drawing.Point(160, 5)
$btnSynchronisation.BackColor = [System.Drawing.Color]::Green
$btnSynchronisation.ForeColor = [System.Drawing.Color]::White

$FooterLabel.Controls.Add($btnSynchronisation)
# =============================================================
# Button rédémarrer
# =============================================================
$btnRedemarrer = New-Object System.Windows.Forms.Button
$btnRedemarrer.Text = "Rédémarrer"
$btnRedemarrer.Size = New-Object System.Drawing.Size(100, 30)
$btnRedemarrer.Location = New-Object System.Drawing.Point(365, 5)
$btnRedemarrer.BackColor = [System.Drawing.Color]::Blue
$btnRedemarrer.ForeColor = [System.Drawing.Color]::White

$btnRedemarrer.Add_Click(
    {
        FnClose
        FnRedemarrer
    }
)
$FooterLabel.Controls.Add($btnRedemarrer)

$form.Controls.Add($FooterLabel)
$form.ShowDialog()