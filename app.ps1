Import-Module .\logiques.ps1

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Page de démarrage"
$form.Size = New-Object System.Drawing.Size(500, 550)

# =============================================================
# HeaderLabel
# =============================================================
$HeaderLabel = New-Object System.Windows.Forms.Label
$HeaderLabel.Size = New-Object System.Drawing.Size(470, 55)
$HeaderLabel.Location = New-Object System.Drawing.Point(5, 30)
# $HeaderLabel.BackColor = [System.Drawing.Color]::Red
$HeaderLabel.ForeColor = [System.Drawing.Color]::Black

$form.Controls.Add($HeaderLabel)
# =============================================================
# TextBoxSource
# =============================================================
$TextBoxSource = New-Object System.Windows.Forms.TextBox
$TextBoxSource.Text = ""
$TextBoxSource.Size = New-Object System.Drawing.Size(400, 30)
$TextBoxSource.Location = New-Object System.Drawing.Point(0, 3)
$TextBoxSource.BackColor = [System.Drawing.Color]::FromArgb(214,214,214)
$TextBoxSource.ForeColor = [System.Drawing.Color]::Black

$HeaderLabel.Controls.Add($TextBoxSource)

# =============================================================
# Button Source
# =============================================================
$btnSource = New-Object System.Windows.Forms.Button
$btnSource.Text = "..."
$btnSource.Size = New-Object System.Drawing.Size(40, 20)
$btnSource.Location = New-Object System.Drawing.Point(410, 3)
$btnSource.BackColor = [System.Drawing.Color]::FromArgb(214,214,214)
$btnSource.ForeColor = [System.Drawing.Color]::Black

$btnSource.Add_Click({FolderBrowserDialogSouce})

$HeaderLabel.Controls.Add($btnSource)

# =============================================================
# TextBoxDestination
# =============================================================
$TextBoxDestination = New-Object System.Windows.Forms.TextBox
$TextBoxDestination.Text = ""
$TextBoxDestination.Size = New-Object System.Drawing.Size(400, 30)
$TextBoxDestination.Location = New-Object System.Drawing.Point(0, 30)
$TextBoxDestination.BackColor = [System.Drawing.Color]::FromArgb(214,214,214)
$TextBoxDestination.ForeColor = [System.Drawing.Color]::Black

$HeaderLabel.Controls.Add($TextBoxDestination)

# =============================================================
# Button destination
# =============================================================
$btnDestination = New-Object System.Windows.Forms.Button
$btnDestination.Text = "..."
$btnDestination.Size = New-Object System.Drawing.Size(40, 20)
$btnDestination.Location = New-Object System.Drawing.Point(410, 30)
$btnDestination.BackColor = [System.Drawing.Color]::FromArgb(214,214,214)
$btnDestination.ForeColor = [System.Drawing.Color]::Black

$btnDestination.Add_Click({FolderBrowserDialogDestination})

$HeaderLabel.Controls.Add($btnDestination)

# =============================================================
# LogBox
# =============================================================
$logBox = New-Object System.Windows.Forms.RichTextBox
$logBox.Text = ""
$logBox.Size = New-Object System.Drawing.Size(475, 350)
$logBox.Location = New-Object System.Drawing.Point(5, 100)
$logBox.BackColor = [System.Drawing.Color]::FromArgb(10,12,26)
$logBox.ForeColor = [System.Drawing.Color]::White

$form.Controls.Add($logBox)

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
$btnCopy.Text = "Démarrage de copie"
$btnCopy.Size = New-Object System.Drawing.Size(150, 30)
$btnCopy.Location = New-Object System.Drawing.Point(3, 5)
$btnCopy.BackColor = [System.Drawing.Color]::Blue
$btnCopy.ForeColor = [System.Drawing.Color]::White
$btnCopy.Add_Click({
    $source = $TextBoxSource.Text.Trim()  
    $destination  = $TextBoxDestination.Text.Trim()
    Copy-ToDestination -Path -Source $source -Destination $destination -Force
})

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

$btnSynchronisation.Add_Click({Write-Log })
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