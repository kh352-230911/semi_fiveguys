package com.sh.guys.common.listener;

import com.sh.guys.common.FiveGuysUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class FiveGuysServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        FiveGuysUtils.servletContext = servletContext;
        System.out.println("FiveGuysUtils.servletContext를 설정했습니다. " + FiveGuysUtils.servletContext);
    }
}
