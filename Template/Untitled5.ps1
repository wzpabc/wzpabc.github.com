function init-home{
    begin{
     $csql=cat d:\category.sql 
     $res= Invoke-Sqlcmd -ServerInstance . -Database wzpabc  -Query "$csql"	
     $category=''
     $archive=''
     }
    
    process{ 
    foreach($r in $res){
       if($r.flag -eq 'archive'){ $archive+=$r.r+"`n"}
       elseif($r.flag -eq 'category' ){$category+=$r.r+"`n"}       
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
             '<h2>Category</h2>                                           '
            ,'<p>Both working and lift are important:</p>                        '
            ,'<ul>                                                               '
            , $category   
            ,'</ul>                                                              '
            ,'<h2>Archive</h2>                                           '
             ,'<ul>                                                               '
            , $archive   
            ,'</ul>                                                              '
        )               |Out-File 'sidebartop.html' -Encoding utf8                              
    }
     
    
     
}

function tohtml{
Param(
[Parameter(ValueFromPipeline=$true)]
    $txt, 
    $link='',
    $title='',
    $datetime=''
)
begin{$str='<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'
if ($title -ne ''){$str=$str+"<h2>$title</h2><br />"}
$str="$str `nuploaded by Patrick. $datetime<br />"
if($link -ne ''){$str=$str+"blog>><a  href=`"https://wzpabc.github.io?page=$link`" >wzpabc.github.io?page=$link</a>“}

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

if($link -ne ''){$str=$str+”<br />`nsource>><a  href=`"https://wzpabc.github.io/Template/$link.html`" >https://wzpabc.github.io/Template/$link.html</a>“}
$str
}
} 


function init-CATETORY{
param(
[Parameter(ValueFromPipeline=$true)] $rowset,$cid,$indexs
)
begin{ 
    $des="$cid.html"
    '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'|Out-File $des -Encoding utf8
}
process{
  $indexs |Out-File $des -Encoding utf8 -Append
    foreach($row in $rowset){
        "<H2><a id=`"$($row.id).html`" href=`"#`" onclick=`"return MenuChange(this);`">$($row.pagename)</a></H2>"|Out-File $des -Encoding utf8 -Append
        IF($(Test-Path $row.source ) ){
            cat $row.source|SELECT -First 3|tohtml  -datetime $row.createdate|Out-File $des -Encoding utf8 -Append
            if($row.stat -eq 0) {cat $row.source|tohtml -link $($row.id) -title $($row.pagename) -datetime $row.createdate|Out-File "$($row.id).html" -Encoding utf8  }
        }
    }
   $indexs |Out-File $des -Encoding utf8 -Append
}

}
cls
cd C:\Users\Patrick\git\wzpabc.github.com\Template
init-home
$sql=cat d:\sql.sql 
$rowset= Invoke-Sqlcmd -ServerInstance . -Database wzpabc  -Query "$sql"	

$pageindex=@{}
$tmpset=$rowset| select -Property desc -Unique
foreach($r in $tmpset){
    $strindex=''
    $pages=$rowset|Where-Object -FilterScript{$_.desc -eq  $r.desc}|select -Property cid,desc -Unique
    IF($pages.count -GT 0){
     0..$($pages.count-1)|%{
       $row= $pages[$($_)]
       $strindex=$strindex+ "<a id=`"$($row.cid).html`" href=`"#`" onclick=`"return MenuChange(this);`">Page$($_+1)>></a>|"
        }
        $pageindex["$($r.desc)"]=$strindex.Substring(0,$strindex.Length-1)
    }
}
#$pageindex["SSPS"]|fl

$tmpset=$rowset|Where-Object -FilterScript{$_.desc -ne 'txt'}|select -Property cid -Unique
foreach($r in $tmpset){
    $cids=$rowset|Where-Object -FilterScript{$_.cid -eq  $r.cid} 
    $cid=$($cids|select -First 1).cid
    $desc=$($cids|select -First 1).desc
    init-CATETORY -rowset $cids -cid $cid -indexs $pageindex["$desc"]
}
$rowset|Where-Object -FilterScript{$_.desc -ne 'txt'}|select -Property cid -Unique|ft	
$rowset|Where-Object -FilterScript{$_.desc -ne 'txt'}|ft	
$rowset|Where-Object -FilterScript{$_.desc -ne 'txt'}|select -Property desc -Unique|ft	
$rowset|Where-Object -FilterScript{$_.desc -ne 'txt'}|select -Property cid,desc -Unique|ft	
 
																						   