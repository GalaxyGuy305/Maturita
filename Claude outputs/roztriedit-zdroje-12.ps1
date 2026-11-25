<#
  Roztriedenie zdrojov pre c. 12 (Svetova lit. 2. pol. 20. storocia)

  Co robi:
   1) Presunie 22 PDF z plochého priecinka do struktury Krajina\Autor\[Texty diel]\ a Smery\<smer>\
   2) Premenuje fotky Zmaturuj 138.jpg-161.jpg na <strana>_Svetova-literatura-2-pol-20-storocia.jpg

  Pouzitie (z PowerShellu):
     .\roztriedit-zdroje-12.ps1 -DryRun     # iba vypise, co by urobil
     .\roztriedit-zdroje-12.ps1             # naozaj presunie

  Skript je idempotentny: co uz je presunute, preskoci. Nic nemaze ani neprepisuje.
  Pred spustenim zavri Obsidian (aby nedrzal subory otvorene).
#>
param(
  [string]$Vault = "C:\Users\marti\Documents\Maturita Vault",
  [switch]$DryRun
)

$ErrorActionPreference = "Stop"
$pdfRoot   = Join-Path $Vault "Zdroje\PDFka (Lit)\Svetova lit. 2. pol. 20. storocia"
$photoRoot = Join-Path $Vault "Zdroje\Zmaturuj (Lit)\Svetova lit. 2. pol. 20. storocia"

if (-not (Test-Path -LiteralPath $pdfRoot))   { throw "Nenasiel som: $pdfRoot" }
if (-not (Test-Path -LiteralPath $photoRoot)) { throw "Nenasiel som: $photoRoot" }

# zdrojovy subor (v plochom priecinku) -> cielovy podpriecinok
$pdfMoves = @(
  @("+Ginsberg.pdf",                      "Americká literatúra\Allen Ginsberg\Texty diel"),
  @("+ Ferlinghetti.pdf",                 "Americká literatúra\Lawrence Ferlinghetti\Texty diel"),
  @("Kto chytá v žite - DEJ.pdf",         "Americká literatúra\Jerome David Salinger"),
  @("Kto chytá v žite - ŠTRUKTÚRA.pdf",   "Americká literatúra\Jerome David Salinger"),
  @("J. Heller - Hlava XXII.pdf",         "Americká literatúra\Joseph Heller"),
  @("W. Styron - Sophiina voľba.pdf",     "Americká literatúra\William Styron"),
  @("AC - Cudzinec.pdf",                  "Francúzska literatúra\Albert Camus"),
  @("JPS - Múr.pdf",                      "Francúzska literatúra\Jean-Paul Sartre"),
  @("poviedka MÚR (fulltext).pdf",        "Francúzska literatúra\Jean-Paul Sartre\Texty diel"),
  @("GO - 1984.pdf",                      "Anglická literatúra\George Orwell"),
  @("GO - Zvieracia farma.pdf",           "Anglická literatúra\George Orwell"),
  @("Durrenmatt.pdf",                     "Švajčiarska literatúra\Friedrich Dürrenmatt"),
  @("SB - Čakanie na Godota.pdf",         "Írska literatúra\Samuel Beckett"),
  @("AYM + Obzri sa v hneve.pdf",         "Smery\Angry Young Men"),
  @("absurdná dráma - teória.pdf",        "Smery\Absurdná dráma"),
  @("beat generation - grafické.pdf",     "Smery\Beat generation"),
  @("bg.pdf",                             "Smery\Beat generation"),
  @("k beat gen.pdf",                     "Smery\Beat generation"),
  @("existencializmus.pdf",               "Smery\Existencializmus"),
  @("diela EXIST.pdf",                    "Smery\Existencializmus"),
  @("postmoderna - teória.pdf",           "Smery\Postmoderna"),
  @("UE - Meno ruže.pdf",                 "Smery\Postmoderna\Umberto Eco")
)

$moved = 0; $skipped = 0; $problems = 0

function Move-Safe([string]$from, [string]$toFile) {
  $toDir = Split-Path -Parent $toFile
  $srcExists = Test-Path -LiteralPath $from
  $dstExists = Test-Path -LiteralPath $toFile
  if (-not $srcExists -and $dstExists) { Write-Host "  uz hotove: $toFile" -ForegroundColor DarkGray; $script:skipped++; return }
  if (-not $srcExists)                 { Write-Host "  CHYBA: chyba zdroj $from" -ForegroundColor Red; $script:problems++; return }
  if ($dstExists)                      { Write-Host "  CHYBA: cieľ už existuje, nemením: $toFile" -ForegroundColor Red; $script:problems++; return }
  if ($DryRun) { Write-Host "  [dry-run] $from  ->  $toFile"; $script:moved++; return }
  New-Item -ItemType Directory -Force -Path $toDir | Out-Null
  Move-Item -LiteralPath $from -Destination $toFile
  Write-Host "  presunuté: $(Split-Path -Leaf $from)  ->  $toFile"
  $script:moved++
}

Write-Host "PDF:" -ForegroundColor Cyan
foreach ($m in $pdfMoves) {
  Move-Safe (Join-Path $pdfRoot $m[0]) (Join-Path (Join-Path $pdfRoot $m[1]) $m[0])
}

Write-Host "Fotky Zmaturuj:" -ForegroundColor Cyan
foreach ($n in 138..161) {
  Move-Safe (Join-Path $photoRoot "$n.jpg") (Join-Path $photoRoot "${n}_Svetova-literatura-2-pol-20-storocia.jpg")
}

Write-Host ""
Write-Host "Hotovo. Spracované: $moved, preskočené (už hotové): $skipped, problémy: $problems" -ForegroundColor Green
$left = Get-ChildItem -LiteralPath $pdfRoot -File -ErrorAction SilentlyContinue
if ($left) { Write-Host "V plochom priečinku ostali súbory (neočakávané):" -ForegroundColor Yellow; $left | ForEach-Object { Write-Host "  $($_.Name)" } }
if ($DryRun) { Write-Host "(dry-run: nič sa nezmenilo)" -ForegroundColor Yellow }
