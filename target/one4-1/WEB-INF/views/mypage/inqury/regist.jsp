<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="/WEB-INF/views/mypage/experience/exper_common.jsp"%>

<section class="myInqury">

	<div class="boardTit">
		<div class="t01">1:1문의하기</div>
		<div class="t02">문의를 남겨주시면 최대한 빠른 시일에 답변 드리겠습니다.</div>
	</div>

	<ul class="regist">
		
		
		<li>
			<div class="t1">분류</div>
			<div class="t2 kind">
				<select class="mainKind">
					<option value="0">분류를 선택해주세요</option>
					<option value="1">신청한 캠페인</option>
					<option value="2">진행중인 캠페인</option>
					<option value="3">회원 관련</option>
					<option value="4">사이트 이용 관련</option>
					<option value="5">기타</option>
				</select>
			</div>
		</li>
		<li>
			<div class="t1">문의 제목</div>
			<div class="t2">
				<input type="text" name="title" />
			</div>
		</li>
		<li>
			<div class="t1">문의 내용</div>
			<div class="t2">
				<textarea class="content"></textarea>
			</div>
		</li>
	</ul>

	<div class="registBtn">
		<button type="submit">문의하기</button>
	</div>

</section>
</div>
<script>
	$('.mainKind').change(function() {
		let value = this.value;

		if($('.kind .subKind').length) {
			$('.kind .subKind').remove();
		}

		if(value == 1) {
			getApplyExperienceList();
		} else if(value == 2) {
			getSelectExperienceList();
		}
	});

	function getApplyExperienceList() {
		$.ajax({
			url : '${pageContext.request.contextPath }/board/getApplyExper',
			type : 'get',
			success : function(items) {
				let result = '<select class="subKind">'
							+ '<option class="0">신청하신 캠페인을 선택해주세요.</option>';
				
				if(items.length != 0) {
					items.forEach(function(item) {
						result += '<option value="' + item.e_num +'>' + item.title +'</option>';
					});	
				} else {
					result += '<option>신청하신 켐페인이 없습니다.</option>'
				}

				result += '</select>';
				$('.kind').append(result);
			}, error : function(e) {
				console.log(e);
			}
		});
	}

	function getSelectExperienceList() {
		$.ajax({
			url : '${pageContext.request.contextPath }/board/getSelectExper',
			type : 'get',
			success : function(items) {
				let result = '<select class="subKind">'
							+ '<option class="0">진행중이신 캠페인을 선택해주세요.</option>';

				if(items.length != 0) {
					items.forEach(function(item) {
						result += '<option value="' + item.e_num +'">' + item.title +'</option>';
					});	
				} else {
					result += '<option>진행중인 캠페인이 없습니다.</option>'
				}

				result += '</select>';
				$('.kind').append(result);
			}, error : function(e) {
				console.log(e);
			}
		});
	}

	$('button[type=submit]').click(function() {
		let kind = $('.mainKind option:selected').val();
		let subKind = $('.subKind option:selected').val();
		let title = $('input[name=title]').val();
		let content = $('.content').val();

		if(kind == null || kind == '' || kind == 'undefined') {
			alert('분류를 선택해주세요.');
			$('.mainKind').focus();
			return false;
		}

		if(title == null || title == '') {
			alert('제목을 입력해주세요');
			$('input[name=title]').focus();
			return false;
		}

		if(content == null || content == '') {
			alert('내용을 입력해주세요');
			$('.content').focus();
			return false;
		}

		let sendData = {
			'kind' : kind,
			'subKind' : subKind,
			'title' : title,
			'content' : content
		}

		$.ajax({
			url : '${pageContext.request.contextPath }/board/registInquery',
			type : 'post',
			data : sendData,
			success : function(result) {
				if(result == true) {
					alert('등록 완료, 빠른 시일에 답변 드리겠습니다.');
					location.href = '${pageContext.request.contextPath }//user/mypage/inqury/list';
				} else {
					alert('등록 실패, 지속될 경우 관리자에게 문의해주세요.');
				}
			}
		})
	});
</script>