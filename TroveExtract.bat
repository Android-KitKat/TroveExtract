@ECHO OFF
rem �����ӳٻ���������չ
setlocal EnableDelayedExpansion
rem ��ȡTroveȫ������Դ�ļ���
rem �汾��v1.1.0
rem https://github.com/Android-KitKat/TroveExtract
rem �����ļ�������ϷĿ¼�����д��ļ���
rem ��Դ�ļ�������ȡ����ϷĿ¼��extracted�ļ��С�

rem ���ñ���
title ��ȡ��Դ�ļ�
rem �ж��Ƿ����Trove.exe
if not exist Trove.exe (
  echo Trove.exe�����ڣ��뽫���ļ�������ϷĿ¼��
  goto end
)
rem ��ϷĿ¼
set TROVEDIR=%~dp0
rem �����ļ���
for /R /D %%i in (*) do (
  rem �ж��Ƿ��������
  if exist %%i\index.tfi (
    rem Ŀ���ļ��е����·��
    set TARGETDIR=%%i
    set TARGETDIR=!TARGETDIR:%TROVEDIR%=!
    rem ��ȡ��Դ�ļ�
    echo ��ʼ��ȡ!TARGETDIR!
    Trove.exe -tool extractarchive !TARGETDIR! extracted\!TARGETDIR!
  )
)
echo ��ȡ���
:end
endlocal
pause
