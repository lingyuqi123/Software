REM Create service
if defined gdipp_manual (
	sc create gdipp_svc_32 binpath= "%~f1\gdipp_svc_32.exe" DisplayName= "Iris gdipp Service (32 bit)" start= "auto"
	sc create gdipp_svc_64 binpath= "%~f1\gdipp_svc_64.exe" DisplayName= "Iris gdipp Service (64 bit)" start= "auto"
	
	ping -n 3 -w 1 localhost > NUL
) else (
	set gdipp_manual=1
	call %0 "%~dp0.."
	set gdipp_manual=
)

REM Start 32-bit service
sc start gdipp_svc_32

ping -n 3 -w 1 localhost > NUL

REM Start 64-bit service
sc start gdipp_svc_64

ping -n 3 -w 1 localhost > NUL
