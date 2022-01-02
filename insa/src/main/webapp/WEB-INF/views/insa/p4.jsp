
<%@ page session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>jQuery Table Sort</title>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
/ null 체크
checkValueNull : function (str)
{
    if(typeof str == "indefined" || str == null || str == "")
    {
        return true;
    }
    else
    {
        return false;
    }
},

// 마스킹
maksMaskingValue : function (str)
{
    var preMaskingData = str;
    var MaskingData = "";
    var len = "";

    // 이메일 마스킹
    // 원본   : email1234@daum.net
    // 마스킹 : email1***@daum.net
    var emailMatchValue = preMaskingData.match(/([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9._-]+)/gi);

    if(checkValueNull(emailMatchValue) == true)
    {
        MaskingData = preMaskingData;
    }
    else
    {
        len = emailMatchValue.toString().split('@').length;
        MaskingData = preMaskingData.toString().replace(new RegExp('.(?=.{0,' + len + '}@)', 'gi'), '*');
    }

    // 카드번호 마스킹
    // 원본   : 4000-1234-5678-0000
    // 마스킹 : 4000-****-****-0000

    var cardMatchValue = MaskingData.match(/(\d{4})-(\d{4})-(\d{4})-(\d{4})/gi);
    if(checkValueNull(cardMatchValue) == true)
    {
        MaskingData = MaskingData;
    }
    else
    {
        MaskingData = MaskingData.toString().replace(cardMatchValue, cardMatchValue.toString()
                      .replace(/(\d{4})-(\d{4})-(\d{4})-(\d{4})/gi,"$1-****-****-$4"));
    }

    // 특정 카드일 경우 (MasterCard, Visa, Amex, Discover)
    cardMatchValue = MaskingData.match(/(5[1-5]\d{14})|(4\d{12})(\d{3}?)|3[47]\d{13}|(6011\d{12})/gi);
    if(checkValueNull(cardMatchValue) == true)
    {
        MaskingData = MaskingData;
    }
    else
    {
        MaskingData = MaskingData.toString().replace(cardMatchValue, cardMatchValue.toString()
                      .replace(/(\d{4})(\d{4})(\d{4})(\d{4})/gi,"$1********$4"));
    }

    // 주민번호 마스킹 
    // 원본   : 000101-1234567
    // 마스킹 : 000101-1******

    // - 있을 경우
    var rrnMatchValue = MaskingData
                     .match(/(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}[0-9]{6}\b/gi);
    if(checkValueNull(rrnMatchValue) == true)
    {
        MaskingData = MaskingData;
    }
    else
    {
        len = rrnMatchValue.toString().split('-').length;
        MaskingData = MaskingData.toString().replace(rrnMatchValue,rrnMatchValue.toString()
                      .replace(/(-?)([1-4]{1})([0-9]{6})\b/gi,"$1$2******"));
    }

    // - 없을 경우
    rrnMatchValue = MaskingData.match(/\d{13}/gi);
    if(checkValueNull(rrnMatchValue) == true)
    {
        MaskingData = MaskingData;
    }
    else
    {
        MaskingData = MaskingData.toString().replace(rrnMatchValue,rrnMatchValue.toString()
                      .replace(/([0-9]{6})$/gi,"******"));
    }

    // 전화번호 마스킹
    // 010-0000-0000
    // 010-****-0000 
    var phoneMatchValue = MaskingData.match(/\d{2,3}-\d{3,4}-\d{4}/gi);

    // 00-000-0000 형태인 경우
    if(/-[0-9]{3}-/.test(phoneMatchValue))
    {
        MaskingData= MaskingData.toString().replace(phoneMatchValue, phoneMatchValue.toString()
                     .replace(/-[0-9]{3}-/g, "-***-"));
     
    }
    // 00-0000-0000 형태인 경우
    else if(/-[0-9]{4}-/.test(phoneMatchValue))
    {
        MaskingData= MaskingData.toString().replace(phoneMatchValue, phoneMatchValue.toString()
                     .replace(/-[0-9]{4}-/g, "-****-"));
     
    }

    // - 없을 경우
    // 0101231234 , 01012345678
    phoneMatchValue = MaskingData.length < 11 ? MaskingData.match(/\d{10}/gi) : MaskingData.match(/\d{11}/gi);
    if(checkValueNull(phoneMatchValue) == true)
    {
        MaskingData = MaskingData;
    }
    else
    {
        if(MaskingData.length < 11)
        {
            MaskingData = MaskingData.toString().replace(phoneMatchValue, phoneMatchValue.toString()
                          .replace(/(\d{3})(\d{3})(\d{4})/gi,'$1***$3'));
        }
        else
        {
            MaskingData = MaskingData.toString().replace(phoneMatchValue, phoneMatchValue.toString()
                          .replace(/(\d{3})(\d{4})(\d{4})/gi,'$1****$3'));
        }
    }

    // 계좌번호 마스킹
    // 원본   : 001-01-0010-011 or 001010010011
    // 마스킹 : 001-01-****-011 or 00101****011

    // (구)KB국민은행, (신)KB국민은행, IBK기업은행, NH농협은행, (구)신한은행, (신)신한은행, 우리은행
    // KEB하나은행, (구)외환은행, 씨티은행, DGB대구은행, BNK부산은행, SC제일은행, 케이뱅크, 카카오뱅크
    // 은행마다 계좌번호 형태가 다릅니다.
    // ex)
    // (\d{6}-\d{2}-\d{6})(\d{3}-\d{6}-\d{2}-\d{3})(\d{3}-\d{4}-\d{4}-\d{2})(\d{3}-\d{2}-\d{6})(\d{3}-\d{3}-\d{6})
    // (\d{3}-\d{6}-\d{5})(\d{3}-\d{6}-\d{3})(\d{3}-\d{2}-\d{6}-\d{1})(\d{4}-\d{2}-\d{6})

    // 
    var accountMatchValue = MaskingData.match(/(\d{3}-\d{2}-\d{4}-\d{3})/gi);
    if(checkValueNull(accountMatchValue) == true)
    {
        MaskingData = MaskingData;
    }
    else
    {
        MaskingData = MaskingData.toString().replace(accountMatchValue,accountMatchValue.toString()
                      .replace(/(\d{3})-(\d{2})-(\d{4})-(\d{3}))/gi,'$1-$2-****-$4'));
    }

    // 차량번호 마스킹
    // 원본   : 38육4104
    // 마스킹 : 38육****
    var carNumberMatchValue = MaskingData.match(/[0-9]{2}[가~힣]{1}[\s]*[0-9]{4}/gi);
    if(checkValueNull(carNumberMatchValue) == true)
    {
        MaskingData = MaskingData;
    }
    else
    {
        MaskingData = MaskingData.toString().replace(carNumberMatchValue,carNumberMatchValue.toString()
                      .replace(/([0-9]{4})$/gi,'****'));
    }

    return MaskingData;

}
</script>

<div id="head">HEADER</div>

<div id="main">

    <div id="menu">MENU</div>

    <div id="contents">CONTENTS<br/>Lorem ipsum ...
    
    
    </div>

</div>


 </body>
 </html>