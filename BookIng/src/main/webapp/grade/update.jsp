<%@page import="com.BookIng.grade.service.GradeUpdateService"%>
<%@page import="com.BookIng.grade.vo.GradeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 한글처리
    request.setCharacterEncoding("utf-8");
    // 데이터 수집
    String strGradeNo = request.getParameter("gradeNo");
    int gradeNo = Integer.parseInt(strGradeNo);
    String gradeName = request.getParameter("gradeName");
    GradeVO vo = new GradeVO();
    vo.setGradeNo(gradeNo);
    vo.setGradeName(gradeName);
    
    System.out.println("update.jsp - vo : " + vo);
    
    // DB에 수정처리
    GradeUpdateService service = new GradeUpdateService();
    int result = service.service(vo);
    
    // index로 돌아가자(view가 없으니까)
    response.sendRedirect("list.jsp");
    %>