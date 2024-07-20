:menu
cls
echo Please select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p shape="Enter your choice (1, 2, or 3): "

if "%shape%"=="1" goto circle
if "%shape%"=="2" goto triangle
if "%shape%"=="3" goto quadrilateral
echo Invalid choice, please try again.
pause
goto menu

:circle
set /p radius="Enter the radius of the circle: "
set /a area=31416*%radius%*%radius%/10000
echo The area of the circle is: %area%
pause
goto end

:triangle
set /p a="Enter the length of side a: "
set /p b="Enter the length of side b: "
set /p c="Enter the length of side c: "

echo Calculate area using Heron's formula
set /a s=(%a%+%b%+%c%)/2
set /a area=s*(s-%a%)*(s-%b%)*(s-%c%)
set /a area=%area%^(1/2)
echo The area of the triangle is: %area%

echo Determine the type of triangle
if %a%==%b% if %b%==%c% (
    echo The triangle is equilateral.
) else if %a%==%b% if %a% neq %c% (
    echo The triangle is isosceles.
) else if %a%==%c% if %a% neq %b% (
    echo The triangle is isosceles.
) else if %b%==%c% if %b% neq %a% (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)
pause
goto end

:quadrilateral
set /p length="Enter the length: "
set /p width="Enter the width: "
set /a area=%length%*%width%
echo The area of the quadrilateral is: %area%
if %length%==%width% (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
pause
goto end

:end
exit
