@echo off
d:
cd D:\dev\Android\sdk\platform-tools
 


adb shell wm size


pause





set string=aaa/bbb/ccc
:split
rem ��Ҫ�и��ַ�������/���ŷָ����ȡ�÷ָ��ĵ�һ����ֵ
rem �ٰѷָ���ʣ�µ�ֵ�ظ��軷������string��������ִ��for
rem ��һ�� %string%=aaa/bbb/cc
rem �ڶ��� %string%=bbb/ccc
rem ������ %string%=ccc
rem ���Ĵ� %string%=��,����goto���˳�
for /f "tokens=1,* delims=/" %%i in ("%string%") do (
  echo %%i
  set string=%%j
)
if not "%string%"=="" goto split
  