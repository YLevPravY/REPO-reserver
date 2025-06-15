if %1 == 9 (
color 0%1
title RICKROLL
curl ASCII.live/rick )
set /a x=%1 + 1
color 0%1
title RICKROLL
start %cd%\rr.bat %x%
curl ASCII.live/rick