SET /A test=%RANDOM%
"C:\Program Files\gs\gs9.50\bin\gswin64c.exe" -dBATCH -dSAFER -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dAutoRotatePages=/PageByPage -r600 -sOutputFile="C:\pdf\%test%.pdf" -
cd "C:\PDFSCRIPT"


echo          /Helvetica_Bold 12 selectfont .1 setgray 200 700 moveto (%date% %time%) show> %test%time.ps
COPY top.ps+%test%time.ps %test%topmark.ps /Y /b

COPY %test%topmark.ps+watermark1.ps %test%op1.ps /Y /b


"C:\Program Files\gs\gs9.50\bin\gswin64c.exe" -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="C:\PDF\%test%1.pdf" "C:\PDFSCRIPT\%test%op1.ps" "C:\PDF\%test%.pdf"

"C:\Program Files\SumatraPDF\SumatraPDF.exe" "C:\PDF\%test%1.pdf" -print-to "Front"

del C:\PDF\%test%.pdf
del C:\PDF\%2211test%1.pdf
del %test%op1.ps
del %test%time.ps
del %test%topmark.ps
