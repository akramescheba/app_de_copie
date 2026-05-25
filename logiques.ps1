function FnClose {
    $form.Close()
    $form.Dispose()
}

function FnRedemarrer {
    powershell -ExecutionPolicy ByPass -File app.ps1
}