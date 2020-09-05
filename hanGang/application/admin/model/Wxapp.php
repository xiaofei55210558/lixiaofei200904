<?php

namespace app\admin\model;

use think\Model;

class Wxapp extends Model
{
    
    protected $autoWriteTimestamp = true;
    protected $updateTime         = "updated_time";
    protected $createTime         = "created_time";

    public function getList()
    {
        # code...
        $list = $this->field('*')->order('sort asc,created_time desc')->select();
        return $list;
    }
}
