
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




cd e:\temp
cls
ls *.sql -Recurse |%{insert-doc -category $_.Directory.Name -pagename $_.BaseName -source $_.FullName -menu BigData}








 