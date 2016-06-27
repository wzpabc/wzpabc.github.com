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

function tohtml{
Param(
[Parameter(ValueFromPipeline=$true)]
    $txt, 
    $link='',
    $title=''
)
begin{$str='<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
if ($title -ne ''){$str=$str+"<h2>$title</h2><br />"}
$str="$str `nuploaded by Patrick. $(Get-Date)<br />"
#if($link -ne ''){$str=$str+”<br />`n<a  href=`"https://wzpabc.github.io/Template/$link`" >https://wzpabc.github.io/Template/$link</a>“}

    $str=$str+"<p>"
}
Process
{
     FOREACH ($R IN $txt){
        $str=$str+"$R<br />`n"
     }
}
end{
$str=$str+'</p>';

if($link -ne ''){$str=$str+”<br />`nsource>><a  href=`"https://wzpabc.github.io/Template/$link`" >https://wzpabc.github.io/Template/$link</a>“}
$str
}
} 


function insert-doc
{
    param(
        [Parameter(Position=2)]
        [ValidateSet('Mysql','Basketball','SQL SERVER','RLang','Java','SSPS','Oracle','Hadoop','Linux(Centos)','BigData')]
        [System.String]$category,
        [Parameter(Position=2)]
        [ValidateSet( 'Home','Java','BigData','Rlang')]
        [System.String]$menu,
        [Parameter(Position=0)]
        [System.String]$source,
        [Parameter(Position=1)]
        [System.String]$pagename

    )


    begin{
    #category
    #030301E0-1B5F-4370-9B80-1E8F582568E5	Mysql
    #94DB23A4-F7F5-4C4D-9FA4-30B9283C35B6	Basketball
    #360936B7-A092-426A-8C70-35CC375709F8	SQL SERVER
    #7DF79285-F2BF-462A-B1DF-504BB1B4F101	RLang
    #D25C570B-A5A0-44DC-81F1-7327F5EFBF55	Java
    #F06CD0D2-1CA3-4CCC-B6BB-B81CC83D8702	SSPS
    #3BB75C2D-062D-4277-9905-B9DE55460C71	Oracle
    #E12B767F-D8DD-40CF-8CCA-CA1DC9A79FB7	Hadoop
    #33B6D64C-7147-41D6-A755-EE1B1CA15B3A	Linux(Centos)
    #menu
    #0E1793C6-9F68-40C6-9ED8-3853FB3E6190	Home
    #07815809-720D-4D3C-B609-3FFD563628F7	Java
    #8F76841D-7738-4DE3-B4DF-70F993BF2160	BigData
    #FE42E14A-47E3-43F9-A0FF-E14A979B5899	Rlang
    #5F0006FB-E19B-4E17-8E87-EE612467AFE8	txt    
    $menuid=''
    $categoryid=''    
    }
    process{
        if($category -eq 'Mysql'){$categoryid='030301E0-1B5F-4370-9B80-1E8F582568E5'}
        elseif($category -eq 'Basketball'){$categoryid='94DB23A4-F7F5-4C4D-9FA4-30B9283C35B6'}
        elseif($category -eq 'SQL SERVER'){$categoryid='360936B7-A092-426A-8C70-35CC375709F8'}
        elseif($category -eq 'RLang'){$categoryid='7DF79285-F2BF-462A-B1DF-504BB1B4F101'}
        elseif($category -eq 'Java'){$categoryid='D25C570B-A5A0-44DC-81F1-7327F5EFBF55'}
        elseif($category -eq 'SSPS'){$categoryid='F06CD0D2-1CA3-4CCC-B6BB-B81CC83D8702'}
        elseif($category -eq 'Oracle'){$categoryid='3BB75C2D-062D-4277-9905-B9DE55460C71'}
        elseif($category -eq 'Hadoop'){$categoryid='E12B767F-D8DD-40CF-8CCA-CA1DC9A79FB7'}
        elseif($category -eq 'Linux(Centos)'){$categoryid='33B6D64C-7147-41D6-A755-EE1B1CA15B3A'}
        else{$categoryid='D25C570B-A5A0-44DC-81F1-7327F5EFBF55'}

        if($menu -eq 'Home'){
             $menuid='0E1793C6-9F68-40C6-9ED8-3853FB3E6190'
        }
        elseif($menu -eq 'Java'){
             $menuid='07815809-720D-4D3C-B609-3FFD563628F7'
        }
        elseif($menu -eq 'BigData'){
             $menuid='8F76841D-7738-4DE3-B4DF-70F993BF2160'
        }
        elseif($menu -eq 'Rlang'){
             $menuid='FE42E14A-47E3-43F9-A0FF-E14A979B5899'
        } 
        else{  $menuid='07815809-720D-4D3C-B609-3FFD563628F7'} 

    }
    end{
        $sql="INSERT INTO pages (id,pagename,html,createdate,[desc],category,mid,source)VALUES(newid(),N'$pagename','',getdate(),'','$categoryid','$menuid',N'$source')"
        $sql
        Invoke-Sqlcmd -ServerInstance . -Database wzpabc  -Query $sql
    }
}   



#init-home


function init-menu{
param( [ValidateSet(  'Java','BigData','Rlang')]
[System.String]$menu)
begin{
    $sql="SELECT m.menuname,p.id,p.pagename,p.source FROM menu AS m INNER JOIN pages AS p ON p.mid = m.id WHERE p.mid NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9',  '73AF1B8F-7BEB-407E-81E9-F467351B2E5E',  '7C53387A-EEBF-467A-8010-0F97B2D5B1E3',  '6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C',  '1830E27A-EAE1-4C9E-B1F9-E8690F709C36',  '7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148') and m.menuname='$menu' ORDER BY m.menuname  "
    $des="$menu.html"
    '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'|Out-File $des -Encoding utf8
}
process{
    $rowset=Invoke-Sqlcmd -ServerInstance . -Database wzpabc  -Query $sql
    foreach($row in $rowset){
        "<H2><a id=`"$($row.id).html`" href=`"#`" onclick=`"return MenuChange(this);`">$($row.pagename)</a></H2>"|Out-File $des -Encoding utf8 -Append
        IF(Test-Path $row.source){
            cat $row.source|SELECT -First 3|tohtml  |Out-File $des -Encoding utf8 -Append
            cat $row.source|tohtml -link "$($row.id).html" -title $($row.pagename)|Out-File "$($row.id).html" -Encoding utf8  
        }
    }
    
}

}


function init-CATETORY{
param([Parameter(Position=2)]
        [ValidateSet('Mysql','Basketball','SQL SERVER','RLang','Java','SSPS','Oracle','Hadoop','Linux(Centos)','BigData')]
        [System.String]$category)
begin{
    $sql="	SELECT p.id,c.[desc],p.category,p.pagename,P.SOURCE 	FROM category AS c INNER JOIN pages AS p ON p.category =	c.id 	AND c.[desc] = '$category'	WHERE p.mid NOT IN ('E0DBED43-24F1-45D1-BB6A-7DFFFC9688D9', 	'73AF1B8F-7BEB-407E-81E9-F467351B2E5E', 	'7C53387A-EEBF-467A-8010-0F97B2D5B1E3', 	'6CD8CD82-B8E2-4B80-BAED-27D3B9E7907C', 	'1830E27A-EAE1-4C9E-B1F9-E8690F709C36', 	'7F97E5A1-D59B-4C28-8C5F-4A62EEDC3148')  "
    if($category -eq 'Mysql'){$categoryid='030301E0-1B5F-4370-9B80-1E8F582568E5'}
        elseif($category -eq 'Basketball'){$categoryid='94DB23A4-F7F5-4C4D-9FA4-30B9283C35B6'}
        elseif($category -eq 'SQL SERVER'){$categoryid='360936B7-A092-426A-8C70-35CC375709F8'}
        elseif($category -eq 'RLang'){$categoryid='7DF79285-F2BF-462A-B1DF-504BB1B4F101'}
        elseif($category -eq 'Java'){$categoryid='D25C570B-A5A0-44DC-81F1-7327F5EFBF55'}
        elseif($category -eq 'SSPS'){$categoryid='F06CD0D2-1CA3-4CCC-B6BB-B81CC83D8702'}
        elseif($category -eq 'Oracle'){$categoryid='3BB75C2D-062D-4277-9905-B9DE55460C71'}
        elseif($category -eq 'Hadoop'){$categoryid='E12B767F-D8DD-40CF-8CCA-CA1DC9A79FB7'}
        elseif($category -eq 'Linux(Centos)'){$categoryid='33B6D64C-7147-41D6-A755-EE1B1CA15B3A'}
        else{$categoryid='D25C570B-A5A0-44DC-81F1-7327F5EFBF55'}
    $des="$categoryid.html"
    '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'|Out-File $des -Encoding utf8
}
process{
    $rowset=Invoke-Sqlcmd -ServerInstance . -Database wzpabc  -Query $sql
    foreach($row in $rowset){
        "<H2><a id=`"$($row.id).html`" href=`"#`" onclick=`"return MenuChange(this);`">$($row.pagename)</a></H2>"|Out-File $des -Encoding utf8 -Append
        IF(Test-Path $row.source){
            cat $row.source|SELECT -First 3|tohtml  |Out-File $des -Encoding utf8 -Append
            cat $row.source|tohtml -link "$($row.id).html" -title $($row.pagename)|Out-File "$($row.id).html" -Encoding utf8  
        }
    }
    
}

}

cd e:\temp
init-home
cls
ls *.sql -Recurse |%{insert-doc -category $_.Directory.Name -pagename $_.BaseName -source $_.FullName -menu BigData}
ls *.sql -Recurse |SELECT -First 3|%{insert-doc -category $_.Directory.Name -pagename $_.BaseName -source $_.FullName -menu Java}
ls *.sql -Recurse |SELECT -First 3|%{insert-doc -category $_.Directory.Name -pagename $_.BaseName -source $_.FullName -menu Rlang}
cls 
cd "C:\Users\Patrick\git\wzpabc.github.com\Template"
init-home
init-menu -menu Java
init-menu -menu Rlang
init-menu -menu BigData;


init-CATETORY -category Basketball
init-CATETORY -category BigData
init-CATETORY -category Hadoop
init-CATETORY -category 'Linux(Centos)'
init-CATETORY -category Mysql
init-CATETORY -category Oracle
init-CATETORY -category SSPS
init-CATETORY -category RLang
init-CATETORY -category 'SQL SERVER'
init-CATETORY -category Java;

 