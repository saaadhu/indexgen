for i in `ls *.pdf`
do
  echo $i $(pdfgrep " " $i  -np | tail -n 1 | cut -d':' -f1)
done
