package com.sh.guys.menu.controller;

import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.menu.model.service.MenuService;
import com.sh.guys.menu.model.vo.MenuVo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet("/menu/menuUpdate")
public class MenuUpdateController extends HttpServlet {
    private MenuService menuService = new MenuService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력값 처리
        String no = req.getParameter("no");
//        String restNo = req.getParameter("restNo");
//        String name = req.getParameter("name");
//        String content = req.getParameter("content");
//        String price = req.getParameter("price");

        MenuVo menuVo = new MenuVo();
        menuVo.setNo(no);
//        menuVo.setRestNo(restNo);
//        menuVo.setName(name);
//        menuVo.setContent(content);
//        menuVo.setPrice(Integer.parseInt(price));
        System.out.println(menuVo);

        menuVo = menuService.findForUpdate(menuVo);
        System.out.println(menuVo);

        req.setAttribute("menuVo", menuVo);

        // 3. view단 처리
        req.getRequestDispatcher("/WEB-INF/views/menu/menuUpdate.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력값 처리 및 업로드
        File repository = new File("C:\\Users\\user1\\Dropbox\\Workspaces\\semi_project\\kh352_semi_project\\fiveguys\\src\\main\\webapp\\upload\\picture");

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(repository);
        factory.setSizeThreshold(10 * 1024 * 1024);

        MenuVo menuVo = new MenuVo();

        // ServletFileUpload 실제 요청을 핸들링할 객체
        ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
        try {
            // 전송된 값을 하나의 FileItem으로 관리
            List<FileItem> fileItemList = servletFileUpload.parseRequest(req);

            for (FileItem item : fileItemList) {
                String name = item.getFieldName();
                if (item.isFormField()) {
                    // 일반 텍스트 필드 : Board객체에 설정
                    String value = item.getString("utf-8");
                    System.out.println(name + " = " + value);
                    // Menu객체에 설정자 로직 구현
                    menuVo.setValue(name, value);
                } else {
                    // 파일 : 서버컴퓨터에 저장, 파일정보를 Attachment객체로 만들어서 db에 저장
                    if (item.getSize() > 0) {
                        System.out.println(name);
                        String originalFilename = item.getName(); // 업로드 파일명
                        System.out.println("파일 : " + originalFilename);
                        System.out.println("크기 : " + item.getSize() + " byte");

                        int dotIndex = originalFilename.lastIndexOf(".");
                        String ext = dotIndex > -1 ? originalFilename.substring(dotIndex) : "";

                        UUID uuid = UUID.randomUUID(); // 고유한 문자열 토큰 발급
                        String renamedFilename = uuid + ext;
                        System.out.println("새 파일명 : " + renamedFilename);

                        // 서버컴퓨터 파일 저장
                        File upFile = new File(repository, renamedFilename);
                        item.write(upFile);

                        // MenuPicture 객체 생성
                        MenuPicture menuPicture = new MenuPicture();
                        menuPicture.setRenamedFilename(renamedFilename);
                        menuVo.addMenuPicture(menuPicture);
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        System.out.println(menuVo);

        // 업무로직
        int result = menuService.updateMenu(menuVo);
        req.getSession().setAttribute("msg", "메뉴를 성공적으로 수정했습니다. 😉");

        // 3. redirect
        resp.sendRedirect(req.getContextPath() + "/restaurant/restaurantDetail?no=" + menuVo.getRestNo());
    }
}