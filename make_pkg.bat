:: --------------------------------------- ::
:: Created mod by In1975 for site pspx.ru  ::
:: Modded by YChvanov & rupor & ErikPshat  ::
:: --------------------------------------- ::
@echo off
TITLE -= MAKE PKG HAN TOOLS v1.9.2 =-= by PSPx Team =-
echo.
echo. =================================================================
echo. =                                                               =
echo. =                          --- ENG ---                          =
echo. =                                                               =
echo. =  Please, put to sign into this folder the following folders:  =
echo. =  (name of game folder specifies to name of directory on PS3)  =
echo. =                                                               =
echo. =                          --- RUS ---                          =
echo. =                                                               =
echo. =  ®«®¦¨â¥ ¤«ï ¯®¤¯¨áë¢ ­¨ï ¢ íâã ¤¨à¥ªâ®à¨î á«¥¤ãîé¨¥ ¯ ¯ª¨:  =
echo. =  (¨¬ï ¯ ¯ª¨ ¨£àë ®¯à¥¤¥«ï¥â ¨¬ï ¤¨à¥ªâ®à¨¨ ãáâ ­®¢ª¨ ­  PS3)  =
echo. =                                                               =
echo. =================================================================
echo. =                                                               =
echo. =   ÉÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍÍÍ»   =
echo. =   º BXXS12345 º BXXS12345GAME º BXXS12345DATA º NPXX12345 º   =
echo. =   ÈÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÎÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÍÍ¼   =
echo. =                               º                               =
echo. =   containing folders ^& files  º  á®¤¥à¦ é¨¥ ¯ ¯ª¨ ¨ ä ©«ë     =
echo. =                                                               =
echo. =               USRDIR TROPDIR LICDIR C00 HTMLDIR               =
echo. =        EBOOT.BIN PARAM.SFO ICON0.PNG PIC0.PNG LIC.EDAT        =
echo. =        ICON1.PAM PARAM.HIP  PIC1.PNG PIC2.PNG SND0.AT3        =
echo. =                                                               =
echo. =================================================================
echo.
pause
echo.
for /f "tokens=*" %%B in (%sfxcmd%) do cd /d %%~dpB

setlocal enabledelayedexpansion
set tls=%temp%\tools
set col=%tls%\nhcolor
set conf=%tls%\package.conf

:: „¥« ¥¬ ¢ë¡®à ¬¥¦¤ã DEBUG ¨«¨ RETAIL ¨«¨ RIF Generator.
echo.
echo. Making the choice between DEBUG or RETAIL or RIFGEN|%col% 0E
echo.
%tls%\wsl %tls%\menu.txt "Select an item between DEBUG or RETAIL or RIFGEN compiling..." $item "Select the required action:" /menu /cmdCenter /ontop /fs=12 /bg=#ffCC88 /fc=#440088 /hc=#CC0000 /hh=40
goto Action_%errorlevel%

:Action_1
if exist *.pkg (
echo.
echo.There are old *.pkg files in the folder, do not forget to take them. Move it to the folder BACKUP...|%col% 06
echo.‚ ¯ ¯ª¥ ®áâ «¨áì áâ àë¥ ä ©«ë *.pkg, ­¥ § ¡ë¢ ©â¥ ¨å § ¡¨à âì. ¥à¥¬¥é ¥¬ ¢ ¯ ¯ªã BACKUP...|%col% 06
if not exist BACKUP md BACKUP
move *.pkg BACKUP
echo.
pause
)
echo.
for /d %%d in (*) do (
if exist %%d\PARAM.SFO (
set str=%%d0000000
set dir=!str:~0,16!
for /f "usebackq tokens=3" %%a in (`%tls%\sfoprint "%%d\PARAM.SFO" TITLE_ID`) do set title=%%a
for /f "usebackq tokens=3" %%b in (`%tls%\sfoprint "%%d\PARAM.SFO" CATEGORY`) do set cat=%%b
if !cat!==GD (
set ct=GameData
set pt=DiscGamePatch
)
if !cat!==HD (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==HG (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==DG (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==AT (
set ct=GameExec
set pt=HDDGamePatch
)
echo Making DEBUG PKG...|%col% 0A
%tls%\sfoprint "%%d\PARAM.SFO" TITLE|%col% 0E
%tls%\sfoprint "%%d\PARAM.SFO" TITLE_ID|%col% 0B
echo FOLDER : %%d|%col% 09
echo ContentID = 000000-!title:~0,9!_00-!dir! > %conf%
echo Klicensee = 0x00000000000000000000000000000000 >> %conf%
echo DRMType = Free >> %conf%
echo ContentType = !ct! >> %conf%
echo PackageType = !pt! >> %conf%
echo InstallDirectory = %%d >> %conf%
echo PackageVersion = 01.00 >> %conf%
%tls%\psn_package_npdrm -n -f %conf% %%d
)
)
goto end

:Action_3
if exist *.pkg (
echo.
echo There are old *.pkg files in the folder, do not forget to take them. Move it to the folder BACKUP...|%col% 06
echo ‚ ¯ ¯ª¥ ®áâ «¨áì áâ àë¥ ä ©«ë *.pkg, ­¥ § ¡ë¢ ©â¥ ¨å § ¡¨à âì. ¥à¥¬¥é ¥¬ ¢ ¯ ¯ªã BACKUP...|%col% 06
if not exist BACKUP md BACKUP
move *.pkg BACKUP
echo.
pause
)
echo.
for /d %%d in (*) do (
if exist %%d\PARAM.SFO (
set str=%%d000000000000000
set dir=!str:~0,16!
for /f "usebackq tokens=3" %%a in (`%tls%\sfoprint "%%d\PARAM.SFO" TITLE_ID`) do set title=%%a
for /f "usebackq tokens=3" %%b in (`%tls%\sfoprint "%%d\PARAM.SFO" CATEGORY`) do set cat=%%b
if !cat!==GD (
set ct=GameData
set pt=DiscGamePatch
)
if !cat!==HD (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==HG (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==DG (
set ct=GameExec
set pt=HDDGamePatch
)
if !cat!==AT (
set ct=GameExec
set pt=HDDGamePatch
)
echo Making DEBUG PKG...|%col% 0A
%tls%\sfoprint "%%d\PARAM.SFO" TITLE|%col% 0E
%tls%\sfoprint "%%d\PARAM.SFO" TITLE_ID|%col% 0B
echo FOLDER : %%d|%col% 09
echo ContentID = 000000-!title:~0,9!_00-!dir! > %conf%
echo Klicensee = 0x00000000000000000000000000000000 >> %conf%
echo DRMType = Free >> %conf%
echo ContentType = !ct! >> %conf%
echo PackageType = !pt! >> %conf%
echo InstallDirectory = %%d >> %conf%
echo PackageVersion = 01.00 >> %conf%
%tls%\psn_package_npdrm -n -f %conf% %%d
echo Signing DEBUG PKG to RETAIL...|%col% 0A
%tls%\sfoprint "%%d\PARAM.SFO" TITLE|%col% 0E
%tls%\sfoprint "%%d\PARAM.SFO" TITLE_ID|%col% 0B
echo FOLDER : %%d|%col% 09
echo | %tls%\ps3xploit_rifgen_edatresign 000000-!title:~0,9!_00-!dir!.pkg ps3
echo.
del 000000-!title:~0,9!_00-!dir!.pkg /q
ren 000000-!title:~0,9!_00-!dir!.pkg_signed.pkg 000000-!title:~0,9!_00-!dir!_signed.pkg
)
)
goto end

:Action_5
:: Resign all rap files
:start
echo.
echo. =================================================================
echo. =                                                               =
echo. =                          --- ENG ---                          =
echo. =                                                               =
echo. =           Please paste the PKG file (game from PSN)           =
echo. =          And paste ACT.DAT ^& IDPS.HEX to this folder          =
echo. =                Then press any key to continue                 =
echo. =                                                               =
echo. =                          --- RUS ---                          =
echo. =                                                               =
echo. =          ®¦ «ã©áâ , ¯®«®¦¨â¥ PKG ä ©« (¨£àë ¨§ PSN)          =
echo. =  ¥ § ¡ã¤ìâ¥ ¯®«®¦¨âì ä ©«(ë) ACT.DAT ¨ IDPS.HEX ¢ íâã ¯ ¯ªã  =
echo. =         ‡ â¥¬ ­ ¦¬¨â¥ «î¡ãî ª« ¢¨èã, çâ®¡ë ¯à®¤®«¦¨âì         =
echo. =                                                               =
echo. =================================================================
echo.
pause
echo.
:: Create RAP from base
if not exist *.pkg (
echo PSN Game PKG file not found in this folder.|%col% 0C
echo Please paste the PSN Game PKG file, then press any key to continue...|%col% 0C
echo.
pause
echo.
)
if exist *_signed.pkg (
if not exist SIGNED_PKG md SIGNED_PKG
move *_signed.pkg SIGNED_PKG
echo Found signed.pkg moved to the SIGNED_PKG folder.|%col% 06
echo.
)
for %%i in (*.pkg) do (
echo Extracting PARAM.SFO from game PKG|%col% 0B
if not exist RAPS md RAPS
%tls%\PS3P_PKG_Ripper.exe -s PARAM.SFO -o "%tls%\%%~ni" "%%i"
echo.
echo Searching RAP file in Database|%col% 0B
if not exist "%tls%\%%~ni\PARAM.SFO" (
echo Not found PARAM.SFO in %%i|%col% 0C
echo Please check it.|%col% 0C
echo.
)
if exist "%tls%\%%~ni\PARAM.SFO" (
for /f "usebackq tokens=3" %%s in (`%tls%\sfoprint "%tls%\%%~ni\PARAM.SFO" TITLE_ID`) do set title=%%s
for /f "tokens=1,2,3,4,5,6,7 delims=;" %%a in (%tls%\database) do (
if %%a==!title! (
echo TITLE_ID: %%a [%%c][%%d] %%b|%col% 0A
echo RAP FILE: %%~nxe|%col% 0E
echo RAP NAME: %%f|%col% 0B
echo RAP DATA: %%g|%col% 09
echo.>RAPS\%%f
%tls%\sfk echo %%g +hextobin +setbytes RAPS\%%f 0 -yes || del /q RAPS\%%f && echo Deleted Fake RAP: %%f
echo.
)
)
)
)
:: Check files RAP, act.dat, idps.hex
if not exist RAPS\*.rap (
if not exist RAPS md RAPS
echo Not found RAP file in Database.|%col% 0C
echo Please paste the RAP file to the RAPS folder...|%col% 0C
echo.
%tls%\wpt "Not found *.rap file(s) in Database!" "Please paste the *.rap file(s) to the RAPS folder, then click OK" Ok i
if exist RAPS\*.rap (
set rap=RAPS\*.rap
) else (
echo Not found RAP file in Database.|%col% 0C
echo Please paste the RAP file to the RAPS folder...|%col% 0C
echo.
%tls%\wpt "Not found RAP file(s) in Database" "Do you want to sign the RAP file(s) to RIF?^^Please paste the RAP file(s) to the RAPS folder.^And paste ACT.DAT & IDPS.HEX to this folder.^Then click Yes to continue or click No to exit." YesNo i
if errorlevel 2 goto end
if not exist RAPS\*.rap goto start
)
) else (
set rap=RAPS\*.rap
)
if exist %tls%\exdata del /q %tls%\exdata\*.*
if not exist %tls%\exdata md %tls%\exdata
if not exist act.dat (
echo Not found ACT.DAT file.|%col% 0C
echo Please paste the ACT.DAT file to this folder...|%col% 0C
echo.
%tls%\wpt "Not found ACT.DAT file." "Please paste the ACT.DAT file to this folder, then click OK" Ok i
)
if not exist idps.hex (
echo Not found IDPS.HEX file.|%col% 0C
echo Please paste the IDPS.HEX file to this folder...|%col% 0C
echo.
%tls%\wpt "Not found IDPS.HEX file" "Do you want to sign the RAP file(s) to RIF?^^Please paste the IDPS.HEX file to this folder.^Then click Yes to continue or click No to exit." YesNo i
if errorlevel 2 goto end
if not exist idps.hex goto start
)
:: Signing RAP file(s) to RIF
echo Signing RAP file(s) to RIF|%col% 0B
for %%I in (%rap%) do (
if exist RAPS\%%~nI.rif del RAPS\%%~nI.rif
echo | %tls%\ps3xploit_rifgen_edatresign %%I
xcopy /y RAPS\%%~nI.rif %tls%\exdata
echo.
)
rd /q /s RAPS
:: Sign act.dat
echo Signing act.dat|%col% 0B
copy /y signed_act.dat %tls%\exdata\act.dat && del signed_act.dat
echo.
:: Create package with rif and signed act.dat
set CID=RIF000-INSTALLER_00-MAKERETAILRIFPKG
echo Creating DEBUG PKG from RIF and ACT.DAT|%col% 0B
%tls%\make_package_license -c %CID% %tls%\exdata %CID%.pkg
echo Creating RETAIL PKG from DEBUG PKG|%col% 0B
echo | %tls%\ps3xploit_rifgen_edatresign %CID%.pkg ps3 && del /q %CID%.pkg
echo.
ren %CID%.pkg_signed.pkg %CID%_signed.pkg

:Action_7
:end
echo DONE.|%col% 0A
echo.
echo -------------------BIG thanks for PS3XPLOIT TEAM--------------------|%col% 09
echo For HAN tools by W, escortd3w, bguerville, habib and Specialy Joonie|%col% 06
echo For RESIGNER ACT.DAT/RIF/ENC/EDAT/CONFIG PS2/PSX/PSP content for PS3|%col% 0C
echo For PSPx Team for this utility: in1975, hexcsl, Alex_1985, ErikPshat|%col% 0D
echo --------------------------------------------------------------------|%col% 09
echo.
pause
rd /q /s %tls%