WITH
AIRSPACE_NAMES
AS
(
  SELECT DISTINCT airspace_id, av_type, name
    FROM ENV4.AIRSPACE_VOLUME
   WHERE ac_id = 428
)
SELECT '{ "type": "FeatureCollection", "features": [' ||
        rtrim(swh_map.clobagg('{ "type": "Feature", "geometry": '
        || SWH_MAP.SDO2GEOJSON(SHAPE,3,0,0)
        || ', "properties": {'
        || '"AC_ID": '              || ENV_SP.AC_ID               || ', '
        || '"AV_AIRSPACE_ID": "'    || ENV_SP.AIRSPACE_ID         || '", '
        || '"AV_ICAO_STATE_ID": "'  || ENV_SP.STA_ICAO_STATE_ID   || '", '
        || '"MIN_FLIGHT_LEVEL": '   || ENV_SP.MIN_FLIGHT_LEVEL    || ', '
        || '"MAX_FLIGHT_LEVEL": '   || ENV_SP.MAX_FLIGHT_LEVEL    || ', '
        || '"AV_NAME": "'           || AIRSPACE_NAMES.NAME        || '", '
        || '"SECTOR_TYPE": "'       || ENV_SP.av_type             || '"'
        || '}}' || ',' || chr(13)),',' || chr(13)) || ']}'
  FROM ENV_SP.AIRSPACE_VOLUME ENV_SP
  LEFT JOIN AIRSPACE_NAMES
    ON ENV_SP.airspace_id = AIRSPACE_NAMES.airspace_id
   AND ENV_SP.av_type = AIRSPACE_NAMES.av_type
 WHERE ENV_SP.ac_id = 428
   AND ENV_SP.av_type = 'ES'
   AND ENV_SP.shape IS NOT NULL;