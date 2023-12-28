<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
  <title>인사관리 시스템</title>

  <style>
    .pagination {
      justify-content: center;
    }

    .table td, .table th {
      vertical-align: middle;
      text-align: center;
    }

    .custom-control {
      padding-right: 0
    }

  </style>

</head>






<body>


  <div class="container">

<h2 class="pt-3"> 인사관리시스템 </h2>
<hr>

    <ul class="nav">
      <li class="nav-item">
        <a class="nav-link active" href="/board/list">사원목록</a>
      </li>
    </ul>

<hr>