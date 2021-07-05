<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>카톡 공유</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
    <input type="button" onClick="sendLinkCustom();" value="Custom"/>
    <input type="button" onClick="sendLinkDefault();" value="Default"/>

<script type="text/javascript">
    function sendLinkCustom() {
        Kakao.init("24f056f59d439e22eab3d1d0b80755f1");
        Kakao.Link.sendCustom({
            templateId: 56298
        });
    }
</script>

<script>
try {
  function sendLinkDefault() {
    Kakao.init('24f056f59d439e22eab3d1d0b80755f1')
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '녹녹한 치즈케잌',
        description: '#케익 #녹차 #백범로 #학원 #비트캠프 #분위기',
        imageUrl:
          'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: document.location.href,
            webUrl: document.location.href,
          },
        },
      ],
    })
  }
; window.kakaoDemoCallback && window.kakaoDemoCallback() }
catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
</script>
   
</body>
</html>
