

SET py_download_url=https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe
FOR /F %%i IN ("%py_download_url%") DO SET py_installer_cmd=%%~nxi
set target_dir=C:\Python39

IF EXIST %target_dir% (
    ECHO ERROR: Target install dir %target_dir% already exist.
    GOTO END_ALL
)

IF NOT EXIST %py_installer_cmd% (
    ECHO Downloading %py_download_url%
    curl %py_download_url% -o %py_installer_cmd%
)

%py_installer_cmd% /quite^
    InstallAllUsers=1^
    TargetDir=%target_dir%^
    CompileAll=1^
    PrependPath=1^
    Include_doc=0^
    Include_dev=0^
    Include_launcher=0^
    Include_tcltk=0^
    Include_test=0
   
:END_ALL
