function FnClose {
    $form.Close()
    $form.Dispose()
}

function FnRedemarrer {
    powershell -ExecutionPolicy ByPass -File app.ps1
}

function FolderBrowserDialogSouce ($dialog) {
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($dialog.ShowDialog() -eq "OK") {
        $TextBoxSource.Text = $dialog.SelectedPath 
    }
}

function FolderBrowserDialogDestination ($dialog) {
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($dialog.ShowDialog() -eq "OK") {
        $TextBoxDestination.Text = $dialog.SelectedPath 
    }

}
function Write-Log {
    param([string]$Message)
    $texte = "[ $(Get-Date -Format "dd-MM-yyyy HH:mm:ss") ] - $Message`n"

    $logBox.AppendText($texte)
}

function Copy-ToDestination {

    param(
        [string]$Source,
        [string]$Destination
    )

    if(-not ($Source)) { 
        $confirmation = [System.Windows.Forms.MessageBox]::Show(
            "Source non définie",  "Confirmation", "OK", "Warning")
        if ($confirmation -eq "OK") {
            return
        }

    }
      if(-not ($Destination)) { 
        $confirmation =  [System.Windows.Forms.MessageBox]::Show(
            "Destination non définie",  "Confirmation","OK", "Warning")
        if ($confirmation -eq "OK") {
            return
        }

    }

    $fichiers = Get-ChildItem -Path $Source -File
    $succes++
    $echec++

    Write-Log "INFO : < ======= Début de la copie ======= >`n"

    foreach ($fichier in $fichiers) {
         try{
        Copy-Item -Path $fichier.FullName -Force
          $succes++
        Write-Log "COPIE : $($fichier.Name)"
}catch{
    $echec++
}
    }
     Write-Log "INFO : $($fichiers.Count) copiés`n"
     Write-Log "INFO : < ======= Fin de la copie ======= >`n"

}