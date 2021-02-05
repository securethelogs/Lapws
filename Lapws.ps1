$logo = @('

 ██╗      █████╗ ██████╗ ██╗    ██╗███████╗
 ██║     ██╔══██╗██╔══██╗██║    ██║██╔════╝
 ██║     ███████║██████╔╝██║ █╗ ██║███████╗
 ██║     ██╔══██║██╔═══╝ ██║███╗██║╚════██║
 ███████╗██║  ██║██║     ╚███╔███╔╝███████║
 ╚══════╝╚═╝  ╚═╝╚═╝      ╚══╝╚══╝ ╚══════╝

 @securethelogs scripts to make Microsoft LAPS easier
 Enter "Change" to swap domains

')

$domains = @((Get-ADForest).domains)


$cdom = $domains[0]
$logo

while ($true){

    $cname = ""

  

    write-host "Current Domain: $cdom"

    $cname = Read-Host -Prompt "Computer Name: "

    Write-Output ""

        if ($cname -eq "change"){
        $count = 0
        Write-Output ""

            foreach ($d in $domains){

              write-host " $count - $d"
              $count++
              

}

Write-Output ""

$opt = Read-Host -Prompt "Pick a Domain (Number)"

Write-Output ""

if ($opt -gt ($count -1)){

    write-host "Error ..." -ForegroundColor "Red"

} else {$cdom = $domains[$opt]}


} else {

           try{ (Get-ADComputer $cname -Properties * -Server $cdom).'ms-Mcs-AdmPwd' }catch{}

           Write-Output ""

        }

}


