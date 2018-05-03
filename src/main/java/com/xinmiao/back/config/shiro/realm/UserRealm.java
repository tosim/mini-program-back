package com.xinmiao.back.config.shiro.realm;

import com.xinmiao.back.domain.User;
import com.xinmiao.back.util.PasswordHelper;
import org.apache.shiro.authc.*;
import org.apache.shiro.util.ByteSource;

public class UserRealm extends MyShiroRealm {
    // 认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("userRealm  被调用");
        //获取用户的输入的账号.
        //log.debug("登录时候的认证～～～"+"username = " + String.valueOf(token.getPrincipal()) + ", pass = " + new String((char[])token.getCredentials()));
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        User user = userMapper.selectByTelephone(username);
        if (user == null) throw new UnknownAccountException();
        if (true == user.getIsLocked()) {
            throw new LockedAccountException(); // 帐号锁定
        }
        SimpleAuthenticationInfo authenticationInfo;
        authenticationInfo = new SimpleAuthenticationInfo(
                user, //用户
                user.getPasswd(), //使用密码作为登录凭据
                ByteSource.Util.bytes(username),
                getName()  //realm name
        );

        String encryptPassword = PasswordHelper.encryptPassword(password, username);
        //如果登录成功
        if (encryptPassword.equals(user.getPasswd())) {
            updateUserAndClearOldUserCache(user);
        }

        return authenticationInfo;
    }

}
