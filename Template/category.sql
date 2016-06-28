SELECT 'archive' flag,c+'-1' as id, c as [desc], 
       '<li><a id="' + c + 
        '-1.html" href="#" onclick="return MenuChange(this);">' + c + '(' + 
           CAST(COUNT(ISNULL(id, NEWID())) AS NVARCHAR) + ')</a></li>'     r
    
                      FROM(
         SELECT p.id, cast(datepart(YEAR,p.createdate) AS NVARCHAR(10))+CASE len(datepart(month,p.createdate)) when 1 then '.0' else '.'END+cast(datepart(month,p.createdate) AS NVARCHAR(10)) c
           FROM pages AS p	
       )t GROUP BY c
       UNION ALL
           SELECT 'category'flag, id+'-1' AS id,[desc],'<li><a id="' + id + 
        '-1.html" href="#" onclick="return MenuChange(this);">' + [DESC] + '(' + 
        cnt + ')</a></li>'     r FROM(
            SELECT CAST(c.id AS NVARCHAR(36)) id,c.[desc],CAST(COUNT(ISNULL(p.category, NEWID())) AS NVARCHAR)
                    cnt FROM category AS c LEFT JOIN pages AS p ON p.category = 
                    c.id GROUP BY c.id,c.[desc]
        )                      t