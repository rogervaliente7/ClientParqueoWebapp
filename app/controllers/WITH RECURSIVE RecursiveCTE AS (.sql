WITH RECURSIVE RecursiveCTE AS (
  -- Anchor member: Select the root areas (those with no father)
  SELECT
    id_area,
    nombre,
    descripcion,
    id_area_padre,
    NULL::INTEGER[] AS path
  FROM
    Area
  WHERE
    id_area_padre IS NULL

  UNION ALL

  -- Recursive member: Select the child areas
  SELECT
    a.id_area,
    a.nombre,
    a.descripcion,
    a.id_area_padre,
    rc.path || a.id_area
  FROM
    Area a
  JOIN
    RecursiveCTE rc ON a.id_area_padre = rc.id_area
)
-- Main query: Select data from the RecursiveCTE
SELECT
  r.id_area,
  r.nombre,
  r.descripcion,
  r.id_area_padre,
  (
    SELECT
      jsonb_agg(
        jsonb_build_object(
          'id_area', rc.id_area,
          'nombre', rc.nombre,
          'descripcion', rc.descripcion,
          'id_area_padre', rc.id_area_padre
        )
      )
    FROM
      RecursiveCTE rc
    WHERE
      rc.path[1] = r.id_area
  ) AS children_areas
FROM
  RecursiveCTE r
WHERE
  NOT EXISTS (
    SELECT 1
    FROM
      RecursiveCTE r2
    WHERE
      r.id_area = r2.path[array_length(r2.path, 1)]
  )
ORDER BY
  r.id_area;