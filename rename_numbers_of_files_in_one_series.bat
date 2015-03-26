rem rename_numbers_of_files_in_one_series
cls
@echo off
cls
color 17
echo.
echo.
title rename_numbers_of_files_in_one_series
echo                             ************************
echo                       rename_numbers_of_files_in_one_series
echo                             ************************
echo            **********************************************************
echo            *                    designed by Gavin                   *
echo            *         created time:   2010-09-05 ÐÇÆÚÈÕ  15:59       *
echo            *                   all rights reserved                  *
echo            **********************************************************

for /f "tokens=*" %%n in ('dir /b') do (
if %%n==ourdev_552047.pdf rename %%n "Mini A Socket right angle SMT type.pdf"  
if %%n==ourdev_552048.pdf rename %%n "Mini B plug soldering type.pdf"  
if %%n==ourdev_552049.pdf rename %%n "Mini B Socket right angle Dip type.pdf"  
if %%n==ourdev_552050.pdf rename %%n "Mini USB B type socket, top entry.pdf"  
if %%n==ourdev_552051.pdf rename %%n "Standard A Type, Male, Cable End Connector Available for Soldering Type.pdf"
if %%n==ourdev_552052.pdf rename %%n "Standard B Type, Male, Cable End Connector Available for Crimping Type.pdf"  
if %%n==ourdev_552053.pdf rename %%n "Standard B Type, Male, Cable End Connector Available for Soldering Type.pdf"  
if %%n==ourdev_552054.pdf rename %%n "Standard USB Mini-A Type, Male, Cable End Connector, Soldering Type.pdf"  
if %%n==ourdev_552055.pdf rename %%n "Standard USB Mini-AB Type, Female, Single Deck, Right Angle (SMT).pdf"  
if %%n==ourdev_552056.pdf rename %%n "Standard USB Mini-B Type, Female, Single Deck, Right Angle (SMT).pdf"  
if %%n==ourdev_552057.pdf rename %%n "STD A Plug long shell crimping type.pdf"  
if %%n==ourdev_552058.pdf rename %%n "STD A Plug long shell soldering type.pdf"  
if %%n==ourdev_552059.pdf rename %%n "STD A Plug PCB DIP type.pdf"  
if %%n==ourdev_552060.pdf rename %%n "STD A Plug PCB SMT type.pdf"  
if %%n==ourdev_552061.pdf rename %%n "STD A Plug soldering type short body connector.pdf"  
if %%n==ourdev_552062.pdf rename %%n "STD A Socket cable-end soldering typepdf.pdf"  
if %%n==ourdev_552063.pdf rename %%n "STD A Socket up-right angle Dip type.pdf" 
if %%n==ourdev_552064.pdf rename %%n "STD A Type, Female, Double Deck, Right Angle (DIP).pdf"  
if %%n==ourdev_552065.pdf rename %%n "STD A Type, Female, Single Deck, Right Angle (DIP).pdf"  
if %%n==ourdev_552066.pdf rename %%n "STD A Type, Female, Single Deck, Right Angle (SMT).pdf"  
if %%n==ourdev_552067.pdf rename %%n "STD A Type, Female, Single Deck, Top-Entry (DIP).pdf"  
if %%n==ourdev_552068.pdf rename %%n "STD A Type, Single Deck, Cable End for Panel or Adaptor Application.pdf"  
if %%n==ourdev_552069.pdf rename %%n "STD B Plug long shell crimping type.pdf"  
if %%n==ourdev_552070.pdf rename %%n "STD B Plug long shell soldering type.pdf"  
if %%n==ourdev_552071.pdf rename %%n "STD B Socket cable-end soldering type.pdf"  
if %%n==ourdev_552072.pdf rename %%n "STD B Socket right angle SMT type.pdf"  
if %%n==ourdev_552073.pdf rename %%n "STD B Socket top entry, Dip type.pdf"  
if %%n==ourdev_552074.pdf rename %%n "STD B Type, Female, Single Deck, Right Angle (DIP).pdf"
)

echo job's done!
pause  

 