<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Document Title -->
    <title>listMyRatingReview</title>
     
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
		<!-- Vendor CSS -->
		<link href="../../resources/lib/bootstrap/css/bootstrap.css" rel="stylesheet" />
		<link href="../../resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet" />
		<link href="../../resources/lib/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
		<!-- Theme CSS -->
		<link href="../../resources/css/theme.css" rel="stylesheet" />
		<!-- Skin CSS -->
		<link href="../../resources/css/skins/default.css" rel="stylesheet" />
		<!-- Theme Custom CSS -->
		<link href="../../resources/css/theme-custom.css" rel="stylesheet" >
		<!-- Head Libs -->
		<script src="../../resources/lib/modernizr/modernizr.js"></script>
    <!-- JavaScripts -->
    <script src="../../resources/lib/jquery/jquery.js"></script>
    <script src="../../resources/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../resources/lib/wow/wow.js"></script>
    <script src="../../resources/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="../../resources/lib/isotope/isotope.pkgd.js"></script>
    <script src="../../resources/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="../../resources/lib/flexslider/jquery.flexslider.js"></script>
    <script src="../../resources/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="../../resources/lib/smoothscroll.js"></script>
    <script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
    <script src="../../resources/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="../../resources/js/plugins.js"></script>
    <script src="../../resources/js/main.js"></script>
    <!-- Kakao Map-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6f8199ad71211c3df709f290a0e83244&libraries=services"></script>
    <!-- Default stylesheets-->
    <link href="../../resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="../../resources/lib/animate.css/animate.css" rel="stylesheet">
    <link href="../../resources/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../resources/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="../../resources/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="../../resources/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../../resources/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="../../resources/lib/magnific-popup/magnific-popup.css" rel="stylesheet">
    <link href="../../resources/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">       
    <!-- Main stylesheet and color file-->
    <link href="../../resources/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="../../resources/css/colors/default.css" rel="stylesheet">  

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <style>
      .starR{
          background: url('http://127.0.0.1:8080/uploadfiles/ico_review.png') no-repeat right 0;
          background-size: auto 100%;
          width: 15px;
          height: 15px;
          display: inline-block;
          text-indent: -9999px;
          cursor: pointer;
        }
      .starR.on{background-position:0 0;}
      
    </style>

  </head>

<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  
   <main>

      <jsp:include page="../common/header.jsp"></jsp:include>

   <div class="inner-wrapper">
      <jsp:include page="../common/userSideBar.jsp"></jsp:include>
      
      <section class="body">
        <div class="row getReservation" >
            <div class="col-xs-12">
              
              <div class="row" style="padding-top: 20px;">
                <div calss="col-sm-12" style="text-align: center; font-size: x-large; margin-bottom: 10px;">
                  <span class="icon-happy"></span>&nbsp;리뷰 내역&nbsp;<span class="icon-happy"></span>
                </div>
              </div>

              <div>
                <div class="fa-hover col-xs-12" style="text-align: center;">  
                    <span style="color :deeppink">답글이 있는 경우 리뷰 수정, 삭제가 불가능 합니다.</span>
                </div>  
              </div>

              <div class="row">
                <div class="fa-hover col-xs-10" style="text-align: end;">  
                 
                  평점
                  <i class="fa fa-arrow-down"  style="cursor: pointer;" id="statusRatings" data-sort_condition="평점 높은순" ></i>
                  
                  등록일
                  
                  <i class="fa fa-arrow-down"  style="cursor: pointer;" id="reviewRegDate" data-sort_condition="최근 등록일순"></i>
                  
                  &nbsp;&nbsp;&nbsp;
                </div>
              </div>

                <div class="container panel-body" style="margin-bottom: 20px; padding: 70px;">

                  <form id="get_review">
                      <c:set var="i" value="0" />
                        <c:forEach var="review" items="${list}">
                            <c:set var="i" value="${ i+1 }" />
                            <div class="comments reviews">
                                <div class="comment clearfix">
                                  <div class="row">
                                  <div class="img-responsive col-sm-3">
                                    <img class="img-responsive" src="/uploadfiles/campimg/review/${review.img1}" onerror="this.src='/uploadfiles/campimg/campbusiness/camp/no_image.jpg'"/>
                                  </div>

                                  <div class="comment-content clearfix col-sm-8" style="margin-left: 0px; margin-bottom: 0px;">
                                    
                                    <div class="comment-author">
                                      <span style="font-size: large;">${review.user.nickName}</span>&nbsp;
                                      <c:if test="${review.ratingReviewStatus == 1}">
                                        (예약후기)
                                      </c:if>
                                      <c:if test="${review.ratingReviewStatus == 2}">
                                        (커뮤니티글)
                                      </c:if>
                                      <span style="font-size: x-small;">&nbsp;&nbsp;&nbsp;${review.reviewRegDate}</span>
                                      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                      <span class="review_btn_span">
                                      <c:if test="${review.commentRegDate == null}">
                                          <button type="button" class="btn btn-default" value="${review.ratingReviewNo}" data-nick="${review.user.nickName}">수정</button>
                                          <button type="button" class="btn btn-danger" value="${review.ratingReviewNo}" >삭제</button>
                                      </span>
                                      </c:if>
                                    </div>
                                 
                                    <!-- <div class="row">
                                      <div class="starRev col-xs-4" style="text-align: start; top: 3px; padding-left: 20px;">
                                        <span class="starR on" data-star=1.0>별1</span>
                                        <span class="starR"    data-star=2.0>별2</span>
                                        <span class="starR"    data-star=3.0>별3</span>
                                        <span class="starR"    data-star=4.0>별4</span>
                                        <span class="starR"    data-star=5.0>별5</span>
                                        <span id="result_star" style="text-align: center;"></span>
                                      </div>                                          
                                    </div> -->
                                    

                                    <div class="comment-author">
                                      
                                      <c:set var="rating" value="${review.statusRating}" />
                                        <c:if test="${rating < 1.0}">
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                        </c:if>
                                        <c:if test="${rating >= 1.0 && rating < 2.0}">
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                        </c:if>
                                        <c:if test="${rating >= 2.0 && rating < 3.0}">
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                        </c:if>
                                        <c:if test="${rating >= 3.0 && rating < 4.0}">
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                        </c:if>
                                        <c:if test="${rating >= 4.0 && rating < 5.0}">
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star-off"></i></span>
                                        </c:if>
                                        <c:if test="${rating == 5.0}">
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                          <span><i class="fa fa-star star"></i></span>
                                        </c:if>
                                      <span>&nbsp;(${review.statusRating})</span>
                                    </div>

                                    <div class="row">
                                      <p style="padding-left: 20px;">${review.ratingReviewContent}</p>
                                    </div>
                                    
                                    <c:if test="${review.commentRegDate != null}">
                                      <div class="row">
                                          <div class="col-sm-1"></div>
                                          <div class="comment-author font-alt">
                                            re : <span style="font-size: large;">${review.camp.user.campName}</span>
                                                 <span style="font-size: x-small;">&nbsp;${review.commentRegDate}</span>
                                          </div>
                                      </div>
                                      <div class="row">
                                        <div class="col-sm-1"></div>
                                        <div class="comment-body">
                                          <p>&nbsp;&nbsp;${review.comment}</p>
                                        </div>
                                      </div>
                                    </c:if>
                                  
                                  </div>
                                </div>
                              </div>
                              </div>
                              <hr>
                      </c:forEach>

                      <div class="row">
                        <jsp:include page="../common/pageNavigator.jsp"/>
                      </div>
                  
                  </form>
                  
                  <form id="update_review">
                  <input type="hidden" id="camp_ratingreview_no" name="ratingReviewNo" value=>
                  <input type="hidden" id="camp_ratingreview_content" name="ratingReviewContent" value="">
                  </form>

                  <form id="rating_order">  
                    <input type="hidden" name="sortCondition" value="평점 높은순">
                  </form>
                  
                  <form id="regdate_order">  
                    <input type="hidden" name="sortCondition" value="최근 등록일순">
                  </form>
              
                  <form id="pagenavi">
                    <input type="hidden" id="currentPage" name="currentPage" value="0"/>
                    <input type="hidden" name="sortCondition" value="${search.sortCondition}">
                  </form>


              </div>

            </div>
        </div>
      </section>

         
    
      </div>
      
   </main>    
       
     <script src="../../resources/lib/bootstrap/js/bootstrap.js"></script>
     <script src="../../resources/lib/nanoscroller/nanoscroller.css"></script>
     <script src="../../resources/lib/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
     <script src="../../resources/lib/magnific-popup/magnific-popup.js"></script>
     <script src="../../resources/lib/jquery-placeholder/jquery.placeholder.js"></script>
     <!-- Specific Page Vendor -->
     <script src="../../resources/lib/pnotify/pnotify.custom.js"></script>
     <!-- Theme Base, Components and Settings -->
     <script src="../../resources/js/theme.js"></script>
     <!-- Theme Custom -->
     <script src="../../resources/js/theme.custom.js"></script>
     <!-- Theme Initialization Files -->
     <script src="../../resources/js/theme.init.js"></script>
     <!-- Examples -->
     <script src="../../resources/js/examples.lightbox.js"></script>
    
     <script type="text/javascript">

          var currentPage = 1;
        
          function fncGetList(currentPage) {
              $("#currentPage").val(currentPage)
              $("#pagenavi").attr("method","POST").attr("action","/campGeneral/listMyCampRatingReview").submit();
            }


          function updateCampReview(){
               
              let ratingReviewNo = $('#camp_ratingreview_no').val();
              let ratingReviewContent = $('#camp_ratingreview_content').val();

              console.log(ratingReviewNo);
              console.log(ratingReviewContent);

              $(this).parent().parent().next().next().remove;

              $.ajax( 
                    {
                      url : "/campGeneral/json/updateReview/",
                      method : "POST" ,
                      dataType : "json" ,
                      data : JSON.stringify({
                        "ratingReviewNo" : ratingReviewNo,
                        "ratingReviewContent" : ratingReviewContent
                      }),
                      headers : {
                        "Accept" : "application/json",
                        "Content-Type" : "application/json"
                      },
                      success : function(JSONData , status) {
                          var append_node ="";   

                              append_node += "<div class='row'>"
                              append_node += "<div class='comment-body col-xs-7'>"
                              append_node += "<textarea class='form-control' name='ratingReviewContent' value='"+JSONData.ratingReviewContent+"' rows='5' id='request'></textarea>"
                              append_node += "</div>"
                              append_node += "</div>"  

                          var btn = "";
                              btn += "<button type='button' class='btn btn-default' value="+JSONData.ratingReviewNo+">수정</button>"
                              btn += "<button type='button' class='btn btn-danger'>삭제</button>"  

                          $(this).parent().parent().next().append(append_node);

                          $(this).parent().append(btn);
                          $(this).remove();

                      }
  
                 });
            }  
       
        $( function() {

            $('body').on("keyup",".form-control",  function() {

              var content = $(this).val();
              console.log("입력 값"+content);
              $("#camp_ratingreview_content").val(content)

            });

           $('.btn-default').on("click", function(){

              var reviewNo = $(this).val();
                  
                  console.log(reviewNo);

                  $("#camp_ratingreview_no").val(reviewNo);

              var btn = "<button type='button' onclick='updateCampReview()' class='btn btn-default'>확인</button>"
            
              var content = "<div class='row'>"
                  content +="<div class='comment-body col-xs-7'>"
                  content +="<textarea class='form-control' name='reservationRequest' rows='5' id='request'></textarea>"
                  content +="</div>"
                  content +="</div>"
        
              $(this).parent().parent().next().next().empty();
              $(this).parent().parent().next().next().html(content);  

              $(this).parent().append(btn);
              $(this).next().remove();
              $(this).remove();

           });

         

          $("#statusRatings").on("click" , function() {
              $("#rating_order").attr("method","POST").attr("action","/campGeneral/listMyCampRatingReview").submit();
          });
          
          $("#reviewRegDate").on("click" , function() {
              $("#regdate_order").attr("method","POST").attr("action","/campGeneral/listMyCampRatingReview").submit();
          });
  
        });
      </script>

  </body>

</html>