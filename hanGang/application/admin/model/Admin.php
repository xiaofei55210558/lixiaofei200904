<?php

namespace app\admin\model;

use think\Model;

class Admin extends Model
{
    // 自动写时间戳 开启
    // 对应更新时间字段
    // 对应创建时间字段
    protected $autoWriteTimestamp = true;
    protected $updateTime         = "updated_time";
    protected $createTime         = "created_time";

    public function login($user_name, $password)
    {
        return $this
            ->field('*')
            ->where('user_name', 'eq', $user_name)
            ->where('password', 'eq', car_hash($password))
            ->find();
    }
}
