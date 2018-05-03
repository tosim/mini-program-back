package com.xinmiao.back.domain;

import java.math.BigDecimal;
import javax.persistence.*;

public class User {
    /**
     * 用户id
     */
    @Id
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 注册手机号
     */
    @Column(name = "telephone_number")
    private String telephoneNumber;

    /**
     * 登录密码
     */
    private String passwd;

    /**
     * 邮箱，后期补充，可以为空
     */
    private String email;

    /**
     * 收货地址，后期补充，可用为空
     */
    @Column(name = "delivery_address")
    private String deliveryAddress;

    /**
     * 账户余额，整数部分15位，小数部分4位
     */
    private BigDecimal balance;

    /**
     * 累计收益，整数部分8位，小数部分4位
     */
    @Column(name = "totol_profit")
    private BigDecimal totolProfit;

    /**
     * 支付密码，设置了支付密码才能花钱，后期补充
     */
    @Column(name = "pay_passwd")
    private String payPasswd;

    /**
     * 最后一次登录的有效token
     */
    private String token;

    /**
     * 是否冻结
     */
    @Column(name = "is_locked")
    private Boolean isLocked;

    /**
     * 渠道id
     */
    @Column(name = "channel_id")
    private Integer channelId;

    /**
     * 冻结资金，用户提现但是每到账
     */
    @Column(name = "locked_money")
    private BigDecimal lockedMoney;

    /**
     * 性别，0女，1男，2未知
     */
    private Byte gender;

    /**
     * 充值总金额
     */
    @Column(name = "recharge_money")
    private BigDecimal rechargeMoney;

    /**
     * 投资的本金,待收本金
     */
    @Column(name = "bid_money")
    private BigDecimal bidMoney;

    /**
     * 待收利息
     */
    @Column(name = "bid_profit")
    private BigDecimal bidProfit;

    /**
     * 用户姓名
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 获取用户id
     *
     * @return user_id - 用户id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     *
     * @param userId 用户id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取注册手机号
     *
     * @return telephone_number - 注册手机号
     */
    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    /**
     * 设置注册手机号
     *
     * @param telephoneNumber 注册手机号
     */
    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber == null ? null : telephoneNumber.trim();
    }

    /**
     * 获取登录密码
     *
     * @return passwd - 登录密码
     */
    public String getPasswd() {
        return passwd;
    }

    /**
     * 设置登录密码
     *
     * @param passwd 登录密码
     */
    public void setPasswd(String passwd) {
        this.passwd = passwd == null ? null : passwd.trim();
    }

    /**
     * 获取邮箱，后期补充，可以为空
     *
     * @return email - 邮箱，后期补充，可以为空
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置邮箱，后期补充，可以为空
     *
     * @param email 邮箱，后期补充，可以为空
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * 获取收货地址，后期补充，可用为空
     *
     * @return delivery_address - 收货地址，后期补充，可用为空
     */
    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    /**
     * 设置收货地址，后期补充，可用为空
     *
     * @param deliveryAddress 收货地址，后期补充，可用为空
     */
    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress == null ? null : deliveryAddress.trim();
    }

    /**
     * 获取账户余额，整数部分15位，小数部分4位
     *
     * @return balance - 账户余额，整数部分15位，小数部分4位
     */
    public BigDecimal getBalance() {
        return balance;
    }

    /**
     * 设置账户余额，整数部分15位，小数部分4位
     *
     * @param balance 账户余额，整数部分15位，小数部分4位
     */
    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    /**
     * 获取累计收益，整数部分8位，小数部分4位
     *
     * @return totol_profit - 累计收益，整数部分8位，小数部分4位
     */
    public BigDecimal getTotolProfit() {
        return totolProfit;
    }

    /**
     * 设置累计收益，整数部分8位，小数部分4位
     *
     * @param totolProfit 累计收益，整数部分8位，小数部分4位
     */
    public void setTotolProfit(BigDecimal totolProfit) {
        this.totolProfit = totolProfit;
    }

    /**
     * 获取支付密码，设置了支付密码才能花钱，后期补充
     *
     * @return pay_passwd - 支付密码，设置了支付密码才能花钱，后期补充
     */
    public String getPayPasswd() {
        return payPasswd;
    }

    /**
     * 设置支付密码，设置了支付密码才能花钱，后期补充
     *
     * @param payPasswd 支付密码，设置了支付密码才能花钱，后期补充
     */
    public void setPayPasswd(String payPasswd) {
        this.payPasswd = payPasswd == null ? null : payPasswd.trim();
    }

    /**
     * 获取最后一次登录的有效token
     *
     * @return token - 最后一次登录的有效token
     */
    public String getToken() {
        return token;
    }

    /**
     * 设置最后一次登录的有效token
     *
     * @param token 最后一次登录的有效token
     */
    public void setToken(String token) {
        this.token = token == null ? null : token.trim();
    }

    /**
     * 获取是否冻结
     *
     * @return is_locked - 是否冻结
     */
    public Boolean getIsLocked() {
        return isLocked;
    }

    /**
     * 设置是否冻结
     *
     * @param isLocked 是否冻结
     */
    public void setIsLocked(Boolean isLocked) {
        this.isLocked = isLocked;
    }

    /**
     * 获取渠道id
     *
     * @return channel_id - 渠道id
     */
    public Integer getChannelId() {
        return channelId;
    }

    /**
     * 设置渠道id
     *
     * @param channelId 渠道id
     */
    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    /**
     * 获取冻结资金，用户提现但是每到账
     *
     * @return locked_money - 冻结资金，用户提现但是每到账
     */
    public BigDecimal getLockedMoney() {
        return lockedMoney;
    }

    /**
     * 设置冻结资金，用户提现但是每到账
     *
     * @param lockedMoney 冻结资金，用户提现但是每到账
     */
    public void setLockedMoney(BigDecimal lockedMoney) {
        this.lockedMoney = lockedMoney;
    }

    /**
     * 获取性别，0女，1男，2未知
     *
     * @return gender - 性别，0女，1男，2未知
     */
    public Byte getGender() {
        return gender;
    }

    /**
     * 设置性别，0女，1男，2未知
     *
     * @param gender 性别，0女，1男，2未知
     */
    public void setGender(Byte gender) {
        this.gender = gender;
    }

    /**
     * 获取充值总金额
     *
     * @return recharge_money - 充值总金额
     */
    public BigDecimal getRechargeMoney() {
        return rechargeMoney;
    }

    /**
     * 设置充值总金额
     *
     * @param rechargeMoney 充值总金额
     */
    public void setRechargeMoney(BigDecimal rechargeMoney) {
        this.rechargeMoney = rechargeMoney;
    }

    /**
     * 获取投资的本金,待收本金
     *
     * @return bid_money - 投资的本金,待收本金
     */
    public BigDecimal getBidMoney() {
        return bidMoney;
    }

    /**
     * 设置投资的本金,待收本金
     *
     * @param bidMoney 投资的本金,待收本金
     */
    public void setBidMoney(BigDecimal bidMoney) {
        this.bidMoney = bidMoney;
    }

    /**
     * 获取待收利息
     *
     * @return bid_profit - 待收利息
     */
    public BigDecimal getBidProfit() {
        return bidProfit;
    }

    /**
     * 设置待收利息
     *
     * @param bidProfit 待收利息
     */
    public void setBidProfit(BigDecimal bidProfit) {
        this.bidProfit = bidProfit;
    }

    /**
     * 获取用户姓名
     *
     * @return user_name - 用户姓名
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置用户姓名
     *
     * @param userName 用户姓名
     */
    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }
}