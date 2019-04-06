package com.fh.shop.backend.aspect;

import com.fh.shop.backend.biz.log.ILogService;
import com.fh.shop.backend.common.LogAnnotation;
import com.fh.shop.backend.common.webContext;
import com.fh.shop.backend.po.LogVO;
import com.fh.shop.backend.po.User;
import com.fh.shop.backend.util.Global;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

public class Demo_Aspect {
    @Autowired
    private HttpServletRequest request;
   @Resource
    private ILogService logService;


    private  static final Logger LOG=LoggerFactory.getLogger(Demo_Aspect.class);


    public  Object  around(ProceedingJoinPoint pjp){

        //获取方法名
        String methodName = pjp.getSignature().getName();
        //获取类名
        String className = pjp.getTarget().getClass().getName();




        //获取返回值类型
        MethodSignature ms= (MethodSignature)pjp.getSignature();
        Class returnType = ms.getReturnType();
        returnType.getSimpleName();
        String logValue="";
        //获取方法
        Method method = ms.getMethod();
        //判断方法中是否有自定义注解
        if(method.isAnnotationPresent(LogAnnotation.class)){
            //获取自定义注解
            LogAnnotation methodAnnotation = method.getAnnotation(LogAnnotation.class);
            //获取自定义注解的内容
            logValue = methodAnnotation.value();
        }

        //获取用户登录信息
     //   User user = (User) request.getSession().getAttribute(Global.USER_LOGIN_SESSION);
       //创建日志对象
        LogVO logVO = new LogVO();
        Date startTime = new Date();
       // LOG.info("用户{}===进入{}类=======执行{}方法========开始",user.getUserName(),className,methodName);
        Object result=null;
        User user =null;
        try {

            result = pjp.proceed();
          user = (User) webContext.getRequest().getSession().getAttribute(Global.USER_LOGIN_SESSION);
           // user = (User) request.getSession().getAttribute(Global.USER_LOGIN_SESSION);
            Date endTime = new Date();
          logVO.setUserName(user.getUserName());
          logVO.setInfo("==进入"+className+"类=======执行"+methodName+"方法");
          logVO.setCreateTime(startTime);
          logVO.setStatus(Global.LOG_SUCCESS_STATUS);
          logVO.setUseTime((int) (endTime.getTime()-startTime.getTime()));
          logVO.setContent(logValue);
        LOG.info("用户{}===进入{}类=======执行{}方法========成功",user.getUserName(),className,methodName);

        } catch (Throwable throwable) {
            Date endTime = new Date();
            logVO.setUserName(user.getUserName());
            logVO.setInfo("==进入"+className+"类=======执行"+methodName+"方法");
            logVO.setCreateTime(startTime);
            logVO.setStatus(Global.LOG_SUCCESS_STATUS);
            logVO.setUseTime((int) (endTime.getTime()-startTime.getTime()));
            logVO.setContent(logValue);
            logService.addLogMesseage(logVO);
            LOG.info("用户{}===进入{}类=======执行{}方法========失败",user.getUserName(),className,methodName);
            throwable.printStackTrace();
        }

        logService.addLogMesseage(logVO);

        return result;
    }

}
