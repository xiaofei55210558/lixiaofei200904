<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;


class Index extends AdminBase
{
    /**
     * 访问路径
     * index.php/index/index/index
     */
    public function index()
    {
        return view();
    }

    /**
     * 访问路径: index.php/index/index/hello
     */
    public function hello()
    {
        return "Hello";
    }

    /**
     * 验证think模板引擎
     *
     * 访问路径:index.php/index/index/tpl
     */
    public function tpl()
    {
        $hi = 'hello, World';

        $user = [
            'username' => 'xiaoxin',
            'created'  => time(),
            'nickname' => '调皮的小新',
        ];
        $obj = json_decode(json_encode($user));
        // print_r($obj);

        $users = [
            [
                'username' => 'xiaoxin',
                'created'  => time(),
                'nickname' => '调皮的小新',
            ],
            [
                'username' => 'zhang',
                'created'  => time(),
                'nickname' => '调皮的老张',
            ],
            [
                'username' => 'wu',
                'created'  => time(),
                'nickname' => '调皮的老吴',
            ],
        ];

        // 将变量赋值给模板
        $this->assign('hi', $hi);
        $this->assign('user', $user);

        // 多个变量赋值
        $this->assign([
            'obj'   => $obj,
            'users' => $users,
        ]);

        # 调用模板
        return $this->fetch();
    }
}
