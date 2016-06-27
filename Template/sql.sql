SELECT m.menuname,m.createdate,m.creator,m2.[desc],p.pagename,p.category,p.html,p.id
  FROM menu AS m 
  INNER JOIN  mtype AS m2 ON m.[type]=m2.id
LEFT JOIN pages AS p ON p.id=m.pageid
WHERE m.stat=1
ORDER BY m.[type],m.[order]

ALTER TABLE pages ALTER COLUMN html NVARCHAR(4000)

UPDATE pages SET html=N'<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

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
'WHERE id in('B4EA6CB4-B0B0-46ED-A3AC-6761E2C694EF','03AEBA27-F718-43E6-A57F-2EC18C2842C5')

SELECT id,'<a id="'+id+'" href="#" onclick="return LinkChange(this);">'+[DESC]+'('+cnt+')</a>' r from(SELECT cast( c.id AS NVARCHAR(36)) id,c.[desc] ,cast(count(ISNULL(p.category ,newid())) AS NVARCHAR)cnt FROM category AS c LEFT JOIN pages AS p ON p.category = c.id GROUP BY c.id,c.[desc]) t


--UPDATE p SET p.pagename=m.menuname,p.html=m.menuname FROM  pages AS p INNER JOIN menu AS m ON  m.pageid = p.id WHERE p.html='html'