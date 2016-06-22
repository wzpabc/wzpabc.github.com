function init-home{
    begin{
     $sql='SELECT id,[desc],''<li><a id="''+id+''.html" href="#" onclick="return MenuChange(this);">''+[DESC]+''(''+cnt+'')</a></li>'' r from(SELECT cast( c.id AS NVARCHAR(36)) id,c.[desc] ,cast(count(ISNULL(p.category ,newid())) AS NVARCHAR)cnt FROM category AS c LEFT JOIN pages AS p ON p.category = c.id GROUP BY c.id,c.[desc]) t'
     $res=Invoke-Sqlcmd -ServerInstance . -Database wzpabc  -Query $sql
     $category=''
     }
    
    process{ 
    foreach($r in $res){
        $des="$($r.id).html";
        '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'|Out-File $des -Encoding utf8
        $r.desc|Out-File $des -Encoding utf8 -Append
        $category+=$r.r+"`n"
     } 
    }
    end{
     @(
        '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
        ,'                                                                   '
        ,'<h1>Welcome to Patrick''s Page</h1>                                 '
        ,'<p>                                                                '
        ,'1:1 起初 神创造天地。<br/>                                                 '
        ,'1:2 地是空虚混沌，渊面黑暗； 神的灵运行在水面上。<br/>                                   '
        ,'1:3 神说：“要有光。”就有了光。<br/>                                            '
        ,'1:4 神看光是好的，就把光暗分开了。<br/>                                           '
        ,'1:5 神称光为昼，称暗为夜。有晚上，有早晨，这是头一日。<br/>                                 '
        ,'1:6 神说：“诸水之间要有空气，将水分为上下。”                                          '
        ,'</p>                                                               '
        ,'<p>                                                                '
        ,'1:1 起初 神创造天地。<br/>                                                 '
        ,'1:2 地是空虚混沌，渊面黑暗； 神的灵运行在水面上。<br/>                                   '
        ,'1:3 神说：“要有光。”就有了光。<br/>                                            '
        ,'1:4 神看光是好的，就把光暗分开了。<br/>                                           '
        ,'1:5 神称光为昼，称暗为夜。有晚上，有早晨，这是头一日。<br/>                                 '
        ,'1:6 神说：“诸水之间要有空气，将水分为上下。”                                          '
        ,'</p>                                                               '
        ,'<p>                                                                '
        ,'1:1 起初 神创造天地。<br/>                                                 '
        ,'1:2 地是空虚混沌，渊面黑暗； 神的灵运行在水面上。<br/>                                   '
        ,'1:3 神说：“要有光。”就有了光。<br/>                                            '
        ,'1:4 神看光是好的，就把光暗分开了。<br/>                                           '
        ,'1:5 神称光为昼，称暗为夜。有晚上，有早晨，这是头一日。<br/>                                 '
        ,'1:6 神说：“诸水之间要有空气，将水分为上下。”                                          '
        ,'</p>                                                               '
        #,'<p>                                                                '
        #,'	                                                                 '
        #,'</p>                                                               '
        #,'<h2>Skill and hobit</h2>                                           '
        #,'<p>Both working and lift are important:</p>                        '
        #,'<ul>                                                               '
        #, $category   
        #,'                                                                   '
        #,'</ul>                                                              '
        )            |Out-File 'Home.html' -Encoding utf8         
        
          @(
             '<h2>Archive</h2>                                           '
            ,'<p>Both working and lift are important:</p>                        '
            ,'<ul>                                                               '
            , $category   
            ,'                                                                   '
            ,'</ul>                                                              '
        )               |Out-File 'sidebartop.html' -Encoding utf8                              
    }
     
    
     
}
cls 
cd "C:\Users\Patrick\git\wzpabc.github.com\Template"
init-home