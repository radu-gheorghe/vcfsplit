$big_vcf=FileOpen(InputBox ("Input file","Write here the full path of your big VCF file"))
$dest_dir=InputBox ("Destination dir", "Write here the full path of the directory where I should create the small VCF files. Directory should be empty")

$counter = 1
$current_vcf = FileOpen($dest_dir & "\" & $counter & ".vcf", 1)
Local $line = FileReadLine($big_vcf)
While 1
   FileWriteLine($current_vcf, $line) ; write the current line
   Local $line = FileReadLine($big_vcf) ;read the next line
   If @error = -1 Then ExitLoop  ; we reached the end
   If $line = "BEGIN:VCARD" Then  ;move on to the next contact
	  FileClose($current_vcf)
	  $counter = $counter + 1
	  $current_vcf = FileOpen($dest_dir & "\" & $counter & ".vcf", 1)
   EndIf
WEnd
;wrap up
FileClose($current_vcf)
FileClose($big_vcf)