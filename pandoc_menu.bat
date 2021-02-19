@echo off
REM ----------------------------------------------------------------------------
REM Pandoc PDF/HTML Processing
REM ----------------------------------------------------------------------------

cls
goto menu

:menu
cls
echo.
echo  .: Pandoc :.
echo.        
echo ### CHOOSE FORMAT ######################################################################
echo.         
	echo [ 1 ] - PDF
	echo [ 2 ] - HTML
	echo [ 3 ] - HTML+PDF
	echo.
echo ########################################################################################
echo.
REM Uncomment to preserve the last chosen option
REM set "selected="
set /P selected=Choose: 
if "%selected%"=="1" (goto pdf)
if "%selected%"=="2" (goto html)
if "%selected%"=="3" (goto html_pdf)
if "%selected%"=="" (goto menu)


REM ########################################################################################
REM [- 1 -]
REM ########################################################################################

:pdf
del "Unofficial Rules Cyclopedia Companion.pdf"
cls

echo [ Processing PDF ]
echo.

pandoc rc.md -o "Unofficial Rules Cyclopedia Companion.pdf" -H pandoc_head_rc.tex --pdf-engine=xelatex --metadata-file rc.yaml -f gfm -f markdown-implicit_figures --template=pandoc_template_rc.tex

rem styles: tango, breezedark, kate, monochrome, zenburn, espresso, haddock, pygments
rem --highlight-style espresso 
rem -V subparagraph 
rem -t html5
rem --include-in-header listings-setup.tex

PAUSE

goto menu


REM ########################################################################################
REM [- 2 -]
REM ########################################################################################

:html
del "index.htm"
cls

echo [ Processing HTML ]
echo.

pandoc rc.md -o "index.htm" -c "css/pandoc_css_html.css" -f markdown-implicit_figures --standalone --metadata pagetitle="Unofficial Rules Cyclopedia Companion"

rem --self-contained 
rem --standalone

rem PAUSE 
 
goto menu


REM ########################################################################################
REM [- 3 -]
REM ########################################################################################

:html_pdf
del "index.htm"
del "Unofficial Rules Cyclopedia Companion.pdf"
cls

echo [ Processing HTML ]
echo.

pandoc rc.md -o "index.htm" -c "css/pandoc_css_html.css" -f markdown-implicit_figures --standalone --metadata pagetitle="Unofficial Rules Cyclopedia Companion"

echo [ Processing PDF ]
echo.

pandoc rc.md -o "Unofficial Rules Cyclopedia Companion.pdf" -H pandoc_head_rc.tex --pdf-engine=xelatex --metadata-file rc.yaml -f gfm -f markdown-implicit_figures --template=pandoc_template_rc.tex

rem PAUSE

goto menu