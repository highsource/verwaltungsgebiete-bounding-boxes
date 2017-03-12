psql^
 --username=postgres^
 --dbname VG^
 -f export-kreise-bounding-boxes.sql^
 --set=precision="0.1"^
 --set=buffer="0.05"^
 --set=output="'%cd%\kreise-bounding-boxes.txt'"
