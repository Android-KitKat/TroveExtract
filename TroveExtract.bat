@ECHO OFF
rem 设置字符编码为UTF-8。
chcp 65001 > nul
rem 启用延迟环境变量扩展
setlocal EnableDelayedExpansion
rem 提取Trove全部的资源文件。^
版本：v1.1.0^
https://github.com/Android-KitKat/TroveExtract^
将此文件放入游戏目录，运行此文件。^
资源文件将被提取到游戏目录的extracted文件夹。

rem 设置标题
title 提取资源文件
rem 判断是否存在Trove.exe
if not exist Trove.exe (
  echo Trove.exe不存在，请将此文件放入游戏目录。
  goto end
)
rem 游戏目录
set TROVEDIR=%~dp0
rem 遍历文件夹
for /R /D %%i in (*) do (
  rem 判断是否存在索引
  if exist %%i\index.tfi (
    rem 目标文件夹的相对路径
    set TARGETDIR=%%i
    set TARGETDIR=!TARGETDIR:%TROVEDIR%=!
    rem 提取资源文件
    echo 开始提取!TARGETDIR!
    Trove.exe -tool extractarchive !TARGETDIR! extracted\!TARGETDIR!
  )
)
echo 提取完成
:end
endlocal
pause
