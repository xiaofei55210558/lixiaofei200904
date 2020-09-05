<?php

namespace app\admin\controller;

use think\Controller;
use think\Request;


/**
 * 前台用户控制器
 */
class Admin extends Controller
{
    /**
     * 访问路径: index.php/index/user/login
     */
    public function login()
    {
        # 调用模板
        return $this->fetch();
    }

    public function doLogin()
    {
        # code...
        $data = request()->param();

        $admin = model('Admin')->login($data['user_name'], $data['password']);
        if ($admin) {
            session('admin', $admin->toArray());
            $this->redirect('admin/index/index');
        } else {
            $this->error('用户不存在或者密码不正确,请从新确认', url('adimin/admin/login'));
        }
    }

    public function logout()
    {
        # 清空session
        session('admin', null);
        $this->redirect(url('admin/admin/login'));

    }

}
