@echo off
color 0a
pause
echo.>all_funtions.txt
echo.>all_funtion_names.txt
:echo.>test.txt
:type time.htm>>test.txt
:for %%n in (*.htm):cannot get the sorted files(names)
set /a sum=0
for /f "tokens=*" %%n in ('dir/on/b "E:\Study\C Language\FunctionsExamples\all funtions"') do (
set /a sum=sum+1 &:/a is necessary! &: use 'dir/on/b'can get the sorted names
echo %%n>>all_funtion_names.txt
type "E:\Study\C Language\FunctionsExamples\all funtions\%%n">>all_funtions.txt
echo   %sum% processing...     %%n &:confusion:why %sum% cannot add up..
)
echo jobs done! %sum% files copied successfully!
pause
