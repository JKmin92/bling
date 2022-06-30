<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/views/ntf/manage/gnb.jsp"%>


<fmt:formatDate value="${experience.startDate}" var="startDate" pattern="MM.dd"/>
<fmt:formatDate value="${experience.endDate}" var="endDate" pattern="MM.dd"/>
<fmt:formatDate value="${experience.desDate}" var="desDate" pattern="MM.dd"/>
<div class="man_container">

    <section class="experApply">
        <div class="title">
            <h3>${experience.title}</h3>
        </div>
        <div class="btns">
            <div class="changeOpen href_btn"></div>
            <div class="href_btn modify"><a href="${pageContext.request.contextPath}/mana/updateExper?e_num=${experience.e_num}">수정하기</a></div>
            <div class="href_btn modify"><a href="${pageContext.request.contextPath}/mana/addCons?e_num=${experience.e_num}">이미지 수정</a></div>
            <div class="href_btn modify"><a href="${pageContext.request.contextPath}/mana/updateGuide?gNum=${gNum}">가이드라인 수정</a></div>
            <div class="href_btn remove">삭제하기</div>
        </div>
        <div class="experInfo">
            <div class="channel">
                <ul>
                    <li id="chaneel_blog">BLOG</li>
                    <li id="chaneel_instagram">INSTAGRAM</li>
                    <li id="chaneel_youtube">YOUTUBE</li>
                    <li id="chaneel_homepage">홈페이지리뷰</li>
                    <li id="chaneel_store">스토어리뷰</li>
                    <li id="chaneel_receipt">영수증리뷰</li>
                </ul>
            </div>
            <div class="ex_date">
                <div class="t1">모집기간</div>
                <div class="t2">${startDate} ~ ${endDate}</div>
            </div>
            <div class="ex_date">
                <div class="t1">발표일</div>
                <div class="t2">${desDate}</div>
            </div>
        </div>

        <table class="apply_list blog">
            <colgroup>
                <col width="5%">
                <col width="7%">
                <col width="10%">
                <col width="20%">
                <col width="13%">
                <col width="10%">
                <col width="25%">
            </colgroup>
            <thead>
                <tr class="category">
                    
                </tr>
            </thead>
            <tbody class="applyList">
                   
                
            </tbody>
        </table>

    </section>

</div>


<script>

    var applyIndex = 1;

    $(document).ready(function() {

        let blog = ${experience.kind_n};
		let instagram = ${experience.kind_i};
		let homepage = ${experience.kind_h};
		let store = ${experience.kind_s};
		let receipt = ${experience.kind_r};
        let mCategory = '${experience.MCategory}';
        let experOpen = ${experience.open};

        if(experOpen == true) {
            $('.changeOpen').append('OPEN');
            $('.changeOpen').addClass('open');
        } else {
            $('.changeOpen').append('CLOSE');
            $('.changeOpen').addClass('close');
        }

        let category = '<td>No</td>'
                    + '<td>이름</td>'
                    + '<td>연락처</td>'
                    + '<td>email</td>';

		if(blog == true) {
			$('#chaneel_blog').addClass('show');
            category += '<td>blog ID</td>'
                    + '<td>방문자수</td>';
		} else if(instagram == true) {
			$('#chaneel_instagram').addClass('show');
            category += '<td>instagram ID</td>';
		}

		if(homepage == true) {
			$('#chaneel_homepage').addClass('show');
		}

		if(store == true) {
			$('#chaneel_homepage').addClass('show');
		}

		if(receipt == true) {
			$('#chaneel_receipt').addClass('show');
		}

        if(mCategory == '제품') {
            category += '<td>주소지</td>';
        }

        $('.category').append(category);
        
        <c:if test="${!empty applyList}">
            <c:forEach items="${applyList}" var="apply" varStatus="status">
                getApply(${apply.a_num});
            </c:forEach>
        </c:if>
    });

    $('.changeOpen').click(function() {
        let eNum = ${experience.e_num};
        $.ajax({
            url : '${pageContext.request.contextPath}/mana/changeOpen',
            type : 'post',
            data : {'eNum':eNum},
            success : function(open) {
                $('.changeOpen').text('');
                if($('.changeOpen').hasClass('open')) $('.changeOpen').removeClass('open');
                if($('.changeOpen').hasClass('close')) $('.changeOpen').removeClass('close');

                if(open == true) {
                    $('.changeOpen').addClass('open');
                    $('.changeOpen').append('OPEN');
                } else {
                    $('.changeOpen').addClass('close');
                    $('.changeOpen').append('CLOSE');
                }
            },error : function(e) {
                console.log(e);
                alert('오류');
            }
        });
    });

    function getApply(aNum) {
        $.ajax({
                    url : '${pageContext.request.contextPath}/mana/getApply',
                    type : 'post',
                    data : {'aNum':aNum},
                    success : function(result) {
                        if(result!=null) {
                            let address = result.address;
                            let visitRange = result.visitRange;
                            let user = result.user;
                            

                            $('.applyList').append(applyListView(user, result.channel, visitRange, address));
                        }
                    }, error : function(e) {
                        console.log(e);
                    }
                });
    }
    

    function applyListView(user, channel, visitCount, address) {
        let blog = ${experience.kind_n};
		let instagram = ${experience.kind_i};
        let mCategory = '${experience.MCategory}';
        let name = user.name;
        let phone = user.phone_number;
        let email = user.id;

        let list = '<tr><td>' + applyIndex +'</td>'
                    + '<td>' + name + '</td>'
                    + '<td>' + phone +'</td>'
                    + '<td>' + email + '</td>';
        
        if(blog == true) {
            list += '<td>' + channel + '</td>'
                + '<td>' + visitCount + '</td>';
        } else if(instagram == true) {
            list += '<td>' + channel + '</td>';
        }

        if(mCategory == '제품') {
            list += '<td>' + address +'</td>';
        }
                    
                    
        list += '</tr>';
        applyIndex++;

        return list;
    }
</script>