 SELECT m.menuname,m.createdate,m.creator,m2.[desc],p.pagename,p.category,p.html,
        p.id
        FROM menu         AS m 
        INNER JOIN mtype  AS m2 ON m.[type] = m2.id
        LEFT JOIN pages   AS p ON p.id = m.pageid
        WHERE m.stat = 1
        ORDER BY m.[type],m.[order]

ALTER TABLE pages ALTER COLUMN html NVARCHAR(4000)

UPDATE pages
SET    html = 
       N'<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<h1>Welcome to Patrick''s Page</h1>
<p>
1:1 起初 神创造天地。<br/>                                      
1:2 地是空虚混沌，渊面黑暗； 神的灵运行在水面上。<br/>       
1:3 神说：“要有光。”就有了光。<br/>                           
1:4 神看光是好的，就把光暗分开了。<br/>                      
1:5 神称光为昼，称暗为夜。有晚上，有早晨，这是头一日。<br/> 
1:6 神说：“诸水之间要有空气，将水分为上下。”                 
</p>
<p>
	 
</p>
<h2>Skill and hobit</h2>
<p>Both working and lift are important:</p>
<ul>
<li>Basketball</li>
<li>Java</li>
<li>Linux(Centos)</li>
<li>SQL SERVER</li>
<li>Oracle</li>
<li>Mysql</li>
<li>RLang</li>
<li>SSPS</li>
<li>Hadoop</li>

</ul>
'
WHERE  id IN ('B4EA6CB4-B0B0-46ED-A3AC-6761E2C694EF', 
             '03AEBA27-F718-43E6-A57F-2EC18C2842C5')

 SELECT id,'<a id="' + id + '" href="#" onclick="return LinkChange(this);">' +
        [DESC] + '(' + cnt + ')</a>'     r FROM(
            SELECT CAST(c.id AS NVARCHAR(36)) id,c.[desc],CAST(COUNT(ISNULL(p.category, NEWID())) AS NVARCHAR)
                    cnt FROM category AS c LEFT JOIN pages AS p ON p.category =
                    c.id GROUP BY c.id,c.[desc]
        )                                t
        
        
--UPDATE p SET p.pagename=m.menuname,p.html=m.menuname FROM  pages AS p INNER JOIN menu AS m ON  m.pageid = p.id WHERE p.html='html'
        
        
 SELECT * FROM pages AS p
        
        
 SELECT NEWID()
        
 SELECT * FROM menu AS m
        
INSERT INTO menu( id,menuname,stat,createdate,creator,[order],articlecnt,[type])VALUES
( NEWID(),'txt',1 /*{ stat }*/,GETDATE(),1 /*{ creator }*/,1/*{ [order] }*/,0 /*{ articlecnt }*/,
'E4A2B013-F0E3-401D-944A-E5231B9CD4B0')
 SELECT * FROM menu
        
INSERT INTO mtype
 SELECT 'E4A2B013-F0E3-401D-944A-E5231B9CD4B0','other',GETDATE()
        
ALTER TABLE menu DROP COLUMN pageid

         
 SELECT * FROM pages
 SELECT * FROM menu AS m ORDER BY m.[type]
 SELECT * FROM category AS c
          
 SELECT 'update pages set mid='''' where id=''' + CAST(id AS NVARCHAR(36)) +
        '''--' + pagename FROM pages WHERE pagename <> 'p1'

UPDATE pages
SET    mid = '1830E27A-EAE1-4C9E-B1F9-E8690F709C36'
WHERE  id = '03AEBA27-F718-43E6-A57F-2EC18C2842C5'--Home
UPDATE pages
SET    mid = 'FE42E14A-47E3-43F9-A0FF-E14A979B5899'
WHERE  id = 'CE9A46B4-F89C-4B63-B0D4-4150B0E7E5D9'--Rlang
UPDATE pages
SET    mid = '07815809-720D-4D3C-B609-3FFD563628F7'
WHERE  id = 'C8D57037-D173-4B81-B9A1-52D67AAC829E'--Java
UPDATE pages
SET    mid = '8F76841D-7738-4DE3-B4DF-70F993BF2160'
WHERE  id = '8B7397ED-8C23-4D9C-8369-5BD5EA86965E'--BigData
UPDATE pages
SET    mid = '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148'
WHERE  id = '769B9108-E490-4C5B-99AC-6652E4F1B827'--Contact
UPDATE pages
SET    mid = '0E1793C6-9F68-40C6-9ED8-3853FB3E6190'
WHERE  id = 'B4EA6CB4-B0B0-46ED-A3AC-6761E2C694EF'--Home
UPDATE pages
SET    mid = '7C53387A-EEBF-467A-8010-0F97B2D5B1E3'
WHERE  id = '622E6D2E-6873-453D-990F-6DE0EFD9AE1E'--About
UPDATE pages
SET    mid = 'E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9'
WHERE  id = 'CCE6B4DB-4564-4079-95EE-9810BFE62C16'--Profile
UPDATE pages
SET    mid = '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C'
WHERE  id = 'F63B3847-7509-4481-B7CA-DFFE9B5EC819'--Backup
UPDATE pages
SET    mid = '73AF1B8F-7BEB-407E-81E9-F467351B2E5E'
WHERE  id = '43B9CA90-6488-4B7C-9EBF-E1D7E47C5024'--Contact
          
ALTER TABLE pages ADD [source] NVARCHAR(1000)
          

          
UPDATE pages
SET    [source] = N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\日期算法2.sql'
WHERE  id = '03AEBA27-F718-43E6-A57F-2EC18C2842C5'

UPDATE pages
SET    [source] = N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\时间格式转换问题 .sql'
WHERE  id = 'CE9A46B4-F89C-4B63-B0D4-4150B0E7E5D9'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\显示索引消耗的磁盘情况.sql'
WHERE  id = 'C8D57037-D173-4B81-B9A1-52D67AAC829E'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\服务器登录的一些脚本.sql'
WHERE  id = '8B7397ED-8C23-4D9C-8369-5BD5EA86965E'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\构造使用IN子句的动态Transact-SQL方法.sql'
WHERE  id = '769B9108-E490-4C5B-99AC-6652E4F1B827'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\构造使用IN子句的动态Transact-SQL方法进行编号查询.sql'
WHERE  id = 'B4EA6CB4-B0B0-46ED-A3AC-6761E2C694EF'

UPDATE pages
SET    [source] = N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查找丢失的索引.sql'
WHERE  id = '622E6D2E-6873-453D-990F-6DE0EFD9AE1E'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查找指定節點下的子結點和父节点.sql'
WHERE  id = 'CCE6B4DB-4564-4079-95EE-9810BFE62C16'

UPDATE pages
SET    [source] = N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查找无用的索引.sql'
WHERE  id = '27A2CB2F-8867-420B-ACA3-AD612E7F8060'

UPDATE pages
SET    [source] = N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查每个分组前N条记录.sql'
WHERE  id = 'DF3696AC-90C3-4129-9A60-B3CB7A247B6B'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查看存储过程依赖的表.sql'
WHERE  id = 'B1E8E448-0097-48F5-A8B3-C0ADBC812039'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查看指定spid的脚本当前运行情况和状态.sql'
WHERE  id = '450D25BD-6275-4DAB-A09D-CA9F64AB3DFD'

UPDATE pages
SET    [source] = N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查看锁信息.sql'
WHERE  id = 'B3EC2D5C-0201-4EB2-8541-D03FC4DB4054'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查询各节点的父路径函数.sql'
WHERE  id = 'F63B3847-7509-4481-B7CA-DFFE9B5EC819'

UPDATE pages
SET    [source] = 
       N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\查询指定节点及其所有子节点.sql'
WHERE  id = '43B9CA90-6488-4B7C-9EBF-E1D7E47C5024' 
									 




------------------按分类()
--SLIDER
 SELECT id,'<a id="' + id + '" href="#" onclick="return LinkChange(this);">' +
        [DESC] + '(' + cnt + ')</a>' r FROM(
            SELECT CAST(c.id AS NVARCHAR(36)) id,c.[desc],CAST(COUNT(ISNULL(p.category, NEWID())) AS NVARCHAR)
                    cnt FROM category AS c LEFT JOIN pages AS p ON p.category =
                    c.id
            AND p.mid NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
                             '73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
                             '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
                             '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
                             '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
                             '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')
                /*AND P.MID = '5F0006FB-E19B-4E17-8E87-EE612467AFE8' */  GROUP BY 
                                                                               c.id,
                                                                               c.[desc]
        ) 
        
        t
--头
--

 SELECT COUNT(p.id)       cnt,c.[desc] 
        FROM category  AS c INNER JOIN pages AS p ON p.category =
        c.id WHERE p.mid NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
                                '73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
                                '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
                                '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
                                '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
                                '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')  GROUP BY 
                                                                               c.[desc] 
 
 SELECT p.id,c.[desc],p.category,p.pagename 
        FROM category AS c INNER JOIN pages AS p ON p.category =
        c.id 
        AND c.[desc] = 'Oracle'
        WHERE p.mid NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
                           '73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
                           '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
                           '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
                           '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
                           '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')
                    
--每一页 
 SELECT p.id,c.[desc],p.category,p.pagename,p.source
        FROM category AS c INNER JOIN pages AS p ON p.category =
        c.id WHERE p.mid NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
                                '73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
                                '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
                                '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
                                '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
                                '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')
--按菜单
-- 头
 SELECT m.menuname,mid,p.id,p.pagename,p.html,p.createdate,p.source
        FROM menu AS m INNER JOIN pages AS p ON p.mid = m.id
        WHERE p.mid NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
                           '73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
                           '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
                           '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
                           '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
                           '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')
        ORDER BY m.menuname  


 
 SELECT m.menuname,mid,p.id,p.pagename,p.html,p.createdate,p.source
        FROM menu AS m INNER JOIN pages AS p ON p.mid = m.id
        WHERE p.mid   IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
                         '73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
                         '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
                         '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
                         '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
                         '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')
        ORDER BY m.menuname  
 
 
 SELECT m.menuname,id 
        FROM menu AS m 
        WHERE id   IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
                      '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
                      '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
                      '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
                      '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')
        ORDER BY m.menuname
  
UPDATE pages
SET    mid = '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148'
WHERE  mid = '73AF1B8F-7BEB-407E-81E9-F467351B2E5E'

UPDATE pages
SET    mid = '0E1793C6-9F68-40C6-9ED8-3853FB3E6190'
WHERE  mid = '1830E27A-EAE1-4C9E-B1F9-E8690F709C36'
 
  




 SELECT p.id,c.[desc],p.category,p.pagename,P.SOURCE,p.createdate 
        FROM category AS c INNER JOIN pages AS p ON p.category = c.id WHERE p.mid 
        NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
               '73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
               '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
               '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
               '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
               '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148') ORDER BY p.createdate 
        DESC

       
 SELECT REPLACE(
            SUBSTRING(
                source,
                LEN(source) - CHARINDEX('\', REVERSE(source)) + 2,
                LEN(source)
            ),
            '.sql',
            ''
        ) FROM pages p WHERE P.MID = '5F0006FB-E19B-4E17-8E87-EE612467AFE8'  
--
UPDATE p
SET    pagename = REPLACE(
           SUBSTRING(
               source,
               LEN(source) - CHARINDEX('\', REVERSE(source)) + 2,
               LEN(source)
           ),
           '.sql',
           ''
       )
FROM   pages p
WHERE  P.MID = '5F0006FB-E19B-4E17-8E87-EE612467AFE8'
  
UPDATE pages
SET    source = N'E:\ISOFTSTONE\EBook\DBA\数据库笔记\深度排序.sql'
WHERE  id = 'F9DEF46D-663E-46CC-A605-1BE68C7E244B'


 SELECT * FROM pages AS p
 
UPDATE pages
SET    createdate = DATEADD(DAY, RAND() * 10 * (-1), createdate)
 
 
DECLARE @id             UNIQUEIDENTIFIER,
        @pagename       NVARCHAR(100),
        @html           NVARCHAR(4000),
        @createdate     DATE,
        @desc           NVARCHAR(4000),
        @category       UNIQUEIDENTIFIER,
        @mid            UNIQUEIDENTIFIER
 
DECLARE my_cursor CURSOR 
FOR
    SELECT id,pagename,html,createdate,[desc],category,mid
            FROM pages
 
 OPEN my_cursor
 
 FETCH FROM my_cursor INTO @id, @pagename, @html, @createdate, @desc, @category,
                           @mid
 
WHILE @@FETCH_STATUS = 0
BEGIN
    /*{ ... Cursor logic here ... }*/
    UPDATE pages
    SET    createdate = DATEADD(minute, RAND() * 100000 * (-1), createdate)
    WHERE  CURRENT OF my_cursor
    
    FETCH FROM my_cursor INTO @id, @pagename, @html, @createdate, @desc,
    @category, @mid
END
 
 CLOSE my_cursor
 DEALLOCATE my_cursor
 
 
 SELECT id,[desc],'<li><a id="' + id + 
        '.html" href="#" onclick="return MenuChange(this);">' + [DESC] + '(' + 
        cnt + ')</a></li>'     r FROM(
            SELECT CAST(c.id AS NVARCHAR(36)) id,c.[desc],CAST(COUNT(ISNULL(p.category, NEWID())) AS NVARCHAR)
                    cnt FROM category AS c LEFT JOIN pages AS p ON p.category = 
                    c.id GROUP BY c.id,c.[desc]
        )                      t
   
 SELECT id,[desc],'<li><a id="' + id + 
        '.html" href="#" onclick="return MenuChange(this);">' + [DESC] + '(' + 
        cnt + ')</a></li>'     r FROM(
            SELECT CAST(c.id AS NVARCHAR(36)) id,c.[desc],CAST(COUNT(ISNULL(p.category, NEWID())) AS NVARCHAR)
                    cnt FROM category AS c INNER JOIN pages AS p ON p.category = 
                    c.id GROUP BY P.createdate
        )                      t
 SELECT m.menuname,p.id,p.pagename,p.source,p.createdate,P.STAT
   FROM menu AS m INNER 
        JOIN pages AS p ON p.mid = m.id WHERE p.mid NOT IN (
                                                           'E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
                                                           '73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
                                                           '7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
                                                           '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
                                                           '1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
                                                           '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148') 
     --   AND m.menuname = '$menu'
         ORDER BY m.menuname ,p.createdate DESC         
         
         
         
         SELECT cast(datepart(YEAR,p.createdate) AS NVARCHAR(10))+CASE len(datepart(month,p.createdate)) when 1 then '.0' else '.'END+cast(datepart(month,p.createdate) AS NVARCHAR(10))
         
       SELECT c+'-1' as id, c as [desc], 
       '<li><a id="' + c + 
        '-1.html" href="#" onclick="return MenuChange(this);">' + c + '(' + 
           CAST(COUNT(ISNULL(id, NEWID())) AS NVARCHAR) + ')</a></li>'     r
    
                      FROM(
         SELECT p.id, cast(datepart(YEAR,p.createdate) AS NVARCHAR(10))+CASE len(datepart(month,p.createdate)) when 1 then '.0' else '.'END+cast(datepart(month,p.createdate) AS NVARCHAR(10)) c
           FROM pages AS p	
       )t GROUP BY c
           SELECT id+'-1' AS id,[desc],'<li><a id="' + id + 
        '-1.html" href="#" onclick="return MenuChange(this);">' + [DESC] + '(' + 
        cnt + ')</a></li>'     r FROM(
            SELECT CAST(c.id AS NVARCHAR(36)) id,c.[desc],CAST(COUNT(ISNULL(p.category, NEWID())) AS NVARCHAR)
                    cnt FROM category AS c LEFT JOIN pages AS p ON p.category = 
                    c.id GROUP BY c.id,c.[desc]
        )                      t
                         
   SELECT 'category'flag, convert(  NVARCHAR(36),c.id )+'-'+cast(ceiling(row_number()over( PARTITION BY p.category ORDER BY p.createdate   desc)/20)+1 AS NVARCHAR) cid,c.[desc],p.id,p.pagename,P.SOURCE ,p.createdate	,P.STAT
FROM category AS c INNER JOIN pages AS p ON p.category =	c.id 	
--AND c.[desc] = '$category'	
WHERE p.mid NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 	'73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 	'7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 	'6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 	'1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 	'7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')
unioN ALL
SELECT 'menu'flag,convert( NVARCHAR(36), m.menuname )+'-'+cast(ceiling(row_number()over( PARTITION BY m.menuname ORDER BY p.createdate   desc)/20)+1 
AS NVARCHAR)
cid, m.menuname,p.id,p.pagename,p.source,p.createdate,P.STAT
FROM menu AS m INNER 
JOIN pages AS p ON p.mid = m.id WHERE p.mid NOT IN (
'E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 
'73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 
'7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 
'6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 
'1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 
'7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')
UNION ALL
SELECT   'archive'flag,cast(datepart(YEAR,p.createdate) AS NVARCHAR(10))+CASE len(datepart(month,p.createdate)) when 1 then '.0' else '.'END
+cast(datepart(month,p.createdate) AS NVARCHAR(10))+'-'+cast(ceiling(row_number()over( PARTITION BY CONVERT(varchar(6) , p.createdate, 112 )  ORDER BY p.createdate   desc)/20)+1 
AS NVARCHAR) cid
,  CONVERT(varchar(7) , p.createdate, 102 ),  p.id,p.pagename,p.source,p.createdate,P.STAT   FROM pages AS p	
                                                                                                                                                                                                                                                                                                    