package com.sh.guys.review.controller;

import com.sh.guys.review.model.entity.ReviewPicture;
import com.sh.guys.review.model.service.ReviewService;
import com.sh.guys.review.vo.ReviewVo;
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

@WebServlet("/review/reviewCreate")
public class ReviewCreateServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자입력값 처리
        String restNo = req.getParameter("no");
        req.setAttribute("restNo", restNo);

        // 리뷰 작성 페이지로 이동
        req.getRequestDispatcher("/WEB-INF/views/review/reviewCreate.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 사용자가 입력한 리뷰 내용 가져오기
        String restNo = req.getParameter("no");
        System.out.println(restNo);
        File repository = new File("C:\\Users\\user1\\Dropbox\\Workspaces\\semi_project\\kh352_semi_project\\fiveguys\\src\\main\\webapp\\images");
        int sizeThreshold = 10 * 1024 * 1024;


        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(repository);
        factory.setSizeThreshold(sizeThreshold);

        ReviewVo reviewVo = new ReviewVo();
        ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
        try {
            // 전송된 값을 하나의 FileItem으로 관리
            List<FileItem> fileItemList = servletFileUpload.parseRequest(req);

            for (FileItem item : fileItemList) {
                String name = item.getFieldName(); // input의 name 속성 값
                if (item.isFormField()) {
                    // 일반 텍스트 필드 처리
                    String value = item.getString("utf-8");
                    System.out.println(name + " = " + value);
                    reviewVo.setValue(name, value);
                    System.out.println("reviewVo = " + reviewVo);

                } else
                    // 파일 : 서버컴퓨터에 저장, 파일정보를 Attachment객체로 만들어서 db에 저장
                    if (item.getSize() > 0) {
                        System.out.println(name);
                        String originalFilename = item.getName(); // 업로드 파일명
                        System.out.println("파일 : " + originalFilename);
                        System.out.println("크기 : " + item.getSize() + " byte");

                        int dotIndex = originalFilename.lastIndexOf(".");
                        String ext = dotIndex > -1 ? originalFilename.substring(dotIndex) : "";

                        UUID uuid = UUID.randomUUID(); // 고유한 문자열 토큰 발급
                        String renamedFilename = uuid + ext; // 저장된 파일명 (파일덮어쓰기, 인코딩이슈 방지)
                        System.out.println("새 파일명 : " + renamedFilename);

                        // 서버컴퓨터 파일 저장
                        File upFile = new File(repository, renamedFilename);
                        item.write(upFile); // throw Exception

                        ReviewPicture reviewPicture = new ReviewPicture();
                        reviewPicture.setRenamedFilename(renamedFilename);
                        reviewVo.addReviewPicture(reviewPicture);

                    }
            }
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
        // Review 객체를 데이터베이스에 저장
        int result = reviewService.insertReview(reviewVo);
        req.getSession().setAttribute("msg", "리뷰 작성이 성공적으로 완료되었습니다.");
        // 리뷰 목록 페이지로 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/review/reviewList?no=" + restNo );
    }
}




















//package com.sh.guys.review.controller;
//
//import com.sh.guys.review.model.entity.Review;
//import com.sh.guys.review.model.service.ReviewService;
//import com.sh.guys.review.vo.ReviewVo;
//import com.sh.guys.user.model.entity.User;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.File;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/review/reviewCreate")
//public class ReviewCreateServlet extends HttpServlet {
//    private ReviewService reviewService = new ReviewService();
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // 리뷰 작성 페이지로 이동
//        req.getRequestDispatcher("/WEB-INF/views/review/reviewCreate.jsp").forward(req, resp);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        // 사용자가 입력한 리뷰 내용 가져오기
//
//        String content = req.getParameter("content");
//        String restNo = req.getParameter("no");
//        String usersNo = req.getParameter("usersNo");
//        double revScore = Double.parseDouble(req.getParameter("revScore"));
//        System.out.println(content + "   " + usersNo + "    " + restNo +" " + revScore);
//
//        // Review 객체 생성 및 데이터 설정
//        Review review = new Review();
//        review.setContent(content);
//        review.setRestNo(restNo);
//        review.setUsersNo(usersNo);
//        review.setStarGrade(revScore);
//
//        // Review 객체를 데이터베이스에 저장
//        int result = reviewService.insertReview(review);
//        req.getSession().setAttribute("msg", "리뷰 작성이 성공적으로 완료되었습니다.");
//        // 리뷰 목록 페이지로 리다이렉트
//        resp.sendRedirect(req.getContextPath() + "/review/reviewList?no=" + restNo);
//    }
//}