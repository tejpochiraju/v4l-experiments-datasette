pip3 install -U --no-cache-dir -r requirements.txt && \
  rm data.db || true && \
  for f in *.csv
    do
      sqlite-utils insert-files data.db images assets/
      # Add --encoding=latin-1 to the following if your CSVs use a different encoding:
      sqlite-utils insert data.db ${f%.*} $f --csv
      sqlite-utils add-foreign-key data.db filtered path images path
    done

