psql^
 --username=postgres^
 --dbname VG^
 -f export-gemeinden-bounding-boxes.sql^
 --set=precision="0.01"^
 --set=buffer="0.005"^
 --set=output="'%cd%\gemeinden-bounding-boxes.txt'"
