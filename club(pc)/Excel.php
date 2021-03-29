<?php
// header("Content-type:text/html;charset=utf-8");
require_once 'PHPExcel_1.8.0_doc/Classes/PHPExcel.php';

/**导出表格
 * 输入：tableHeader:表头（数组）;tableObj:表的内容**/
function exportExcel($tableHeader,$tableObj,$fileName='data'){
    $excel = new PHPExcel();
    //最多22列
    $letter = array('A','B','C','D','E','F','G','H','I','J',
        'K','L','M','N','O','P','Q','R','S','T','U','V','W');
    for($i = 0;$i<count($tableHeader);$i++){
        $excel->getActiveSheet()->setCellValue("$letter[$i]1","$tableHeader[$i]");
    }

    for($i = 2;$i<=count($tableObj)+1;$i++){
        $j = 0;
        foreach ($tableObj[$i-2] as $value){
            // $excel->getActiveSheet()->setCellValueExplicit("$letter[$j]$i","$value",PHPExcel_Cell_DataType::TYPE_STRING);
            $excel->getActiveSheet()->setCellValue("$letter[$j]$i","$value");
            $j++;
        }
    }
    $write = new PHPExcel_Writer_Excel5($excel);
    header("Pragma:public");
    header("Expires:0");
    header("Cache-Control:must-revalidate,post-check=0,pre-check=0");
    header("Content-Type:application/force-download");
    header("Content-Type:application/vnd.ms-excel");
    header("Content-Type:application/octet-stream");
    header("Content-Type:application/download");
    // $excelName = '绩效得分统计'.time();
  //  header('Content-Disposition: attachment;filename="'.$excelName.'.xlsx"');

   header("Content-Disposition:attachment;filename=$fileName.xls");
    header("Content-Transfer-Encoding:binary");
    $write->save('php://output');
}


/* $tableheader = array('学号','姓名','性别','年龄','班级');

$data = array(array('1','小王','男','20','100'),
    array('2','小李','男','20','101'),
    array('3','小张','男','20','102'),
    array('4','小赵','男','20','103'),
    array('5','小姚','女','20','104'),
); */

/**导出表格
 * 输入：tableHeader:表头（数组）;tableObj:表的内容**/
function exportExcelByString($tableHeader,$tableObj,$fileName='data'){
    $excel = new PHPExcel();
    //最多22列
    $letter = array('A','B','C','D','E','F','G','H','I','J',
        'K','L','M','N','O','P','Q','R','S','T','U','V','W');
    for($i = 0;$i<count($tableHeader);$i++){
        $excel->getActiveSheet()->setCellValue("$letter[$i]1","$tableHeader[$i]");
    }

    for($i = 2;$i<=count($tableObj)+1;$i++){
        $j = 0;
        foreach ($tableObj[$i-2] as $value){
            $excel->getActiveSheet()->setCellValueExplicit("$letter[$j]$i","$value",PHPExcel_Cell_DataType::TYPE_STRING);
            // $excel->getActiveSheet()->setCellValue("$letter[$j]$i","$value");
            $j++;
        }
    }
    $write = new PHPExcel_Writer_Excel5($excel);
    header("Pragma:public");
    header("Expires:0");
    header("Cache-Control:must-revalidate,post-check=0,pre-check=0");
    header("Content-Type:application/force-download");
    header("Content-Type:application/vnd.ms-excel");
    header("Content-Type:application/octet-stream");
    header("Content-Type:application/download");
    header("Content-Disposition:attachment;filename=$fileName.xls");
    header("Content-Transfer-Encoding:binary");
    $write->save('php://output');
}

/**导入表格
 * 输入：导入用户id,当前文件所在层级（根目录为空，一级目录下为../，二级目录下为../../）;
 * 输出：导入成功则返回数据数组,导入失败则返回错误提示**/
function inportExcel($user_id,$layer,$inpufile='stu_excel'){
    require_once 'PHPExcel_1.8.0_doc/Classes/PHPExcel.php';
    require_once 'PHPExcel_1.8.0_doc/Classes/PHPExcel/IOFactory.php';
    require_once 'PHPExcel_1.8.0_doc/Classes/PHPExcel/Reader/Excel5.php';
    
    $output = array("success"=>true);
    if (! empty ( $_FILES [$inpufile] ['name'] ))
    {
        $tmp_file = $_FILES [$inpufile] ['tmp_name'];
        $file_types = explode ( ".", $_FILES [$inpufile] ['name'] );
        $file_type = $file_types [count ( $file_types ) - 1];
    
        /*判别是不是.xls文件，判别是不是excel文件*/
        if(strtolower ( $file_type ) == "xlsx"){
            $creater = 'Excel2007';
        }else if(strtolower ( $file_type ) == "xls"){
            $creater = 'Excel5';
        }else{
            $output['success'] = false;
            $output['msg']  = '不是Excel文件，请上传xlsx或者xls类型的Excel文件';
        }
    
        if($output['success']){
            /*设置上传路径*/
           // $savePath = $layer.'upFile/Excel/';
             $savePath = 'upFile/Excel/';
            /*以时间来命名上传的文件*/
            $str = date ( 'Ymdhis' );
            $file_name = $user_id.'-'.$str . "." . $file_type;
        
            echo '<br>';
            $dest = $savePath.$file_name;
            /*是否上传成功*/
            if (!copy ($tmp_file,$dest))
            {
                $output['success'] = false;
                $output['msg']  = '文件上传失败！';
            }else{
                $str = "";
                $objReader = PHPExcel_IOFactory::createReader($creater);//use excel2007 for 2007 format
                $objPHPExcel = $objReader->load($dest);
                $sheet = $objPHPExcel->getSheet(0);
                $highestRow = $sheet->getHighestRow(); // 取得总行数
                $highestColumn = $sheet->getHighestColumn(); // 取得总列数
        
                $data = array();
                $data_index = 0;
                //循环读取excel文件,读取一条,插入一条
                for($j=1;$j<=$highestRow;$j++)
                {
                    $stu_Item = array();
                    $index = 0;
                    for($k='A';$k<=$highestColumn;$k++)
                    {
                        $str = $objPHPExcel->getActiveSheet()->getCell("$k$j")->getValue();//读取单元格
                        $stu_Item[$index] = mb_convert_encoding($str,'UTF-8','auto');
                        $index++;
                    }
                    $data[$data_index] = $stu_Item;
                    $data_index++;
                }
                $output['success'] = true;
                $output['msg']  = '文件上传成功！';
                $output['data'] = $data;
                $output['fileName']=$dest;
           }
        }
    }else{
        $output['success'] = false;
        $output['msg'] ='文件选择失败！';
    }
    return $output;
}