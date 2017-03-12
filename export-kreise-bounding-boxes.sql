COPY (
	SELECT
		rs,
		minx,
		miny,
		maxx,
		maxy,
		ST_AsText(ST_MakeEnvelope(minx, miny, maxx, maxy, 4326)) as bbox_wkt
	FROM	
		(SELECT
			rs,
			floor(min(st_xmin(geom) - :buffer)/:precision)*:precision as minx,
			floor(min(st_ymin(geom) - :buffer)/:precision)*:precision as miny,
			ceil(max(st_xmax(geom) + :buffer)/:precision)*:precision as maxx,
			ceil(max(st_ymax(geom) + :buffer)/:precision)*:precision as maxy
		FROM
			vg250_krs
		GROUP BY
			rs
		ORDER BY
			rs) AS VG_250_KRS_BBOX
)
TO
	:output
WITH
	CSV
	HEADER QUOTE '"';
