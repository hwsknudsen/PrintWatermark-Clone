SET /A test=%RANDOM%
"C:\Program Files\gs\gs9.50\bin\gswin64c.exe" -dBATCH -dSAFER -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dAutoRotatePages=/PageByPage -r600 -sOutputFile="C:\pdf\%test%.pdf" -
cd "C:\PDF"

"C:\Program Files\gs\gs9.50\bin\gswin64c.exe" -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="C:\PDF\%test%1.pdf" "C:\PDFSCRIPT\watermark1.ps" "C:\PDF\%test%.pdf"
"C:\Program Files\gs\gs9.50\bin\gswin64c.exe" -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="C:\PDF\%test%2.pdf" "C:\PDFSCRIPT\watermark2.ps" "C:\PDF\%test%.pdf"
"C:\Program Files\gs\gs9.50\bin\gswin64c.exe" -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="C:\PDF\%test%3.pdf" "C:\PDFSCRIPT\watermark3.ps" "C:\PDF\%test%.pdf"

"C:\Program Files\SumatraPDF\SumatraPDF.exe" "C:\PDF\%test%1.pdf" -print-to "Front"
"C:\Program Files\SumatraPDF\SumatraPDF.exe" "C:\PDF\%test%2.pdf" -print-to "Front"
"C:\Program Files\SumatraPDF\SumatraPDF.exe" "C:\PDF\%test%3.pdf" -print-to "Front"

del %test%.pdf
del %test%1.pdf
del %test%2.pdf
del %test%3.pdf
