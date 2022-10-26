$("#minus").on("click",function(){
    const Qty = $(this).next();
    const buyQty = Qty.text();
    const minusQty = Number(buyQty)-1;
    Qty.text(minusQty);
});

$("#plus").on("click",function(){
    const Qty = $(this).prev();
    const buyQty = Qty.text();
    const plusQty = Number(buyQty)+1;
    Qty.text(plusQty);
});
/*
$(".subTitle").children().eq(0).on("click",function(){
    $(".detailContentWrap").show();
    $(".reviewContentWrap").hide();
    $(".refundWrap").hide();
    $(this).addClass("selectColor");
});

$(".subTitle").children().eq(1).on("click",function(){
    $(".detailContentWrap").hide();
    $(".reviewContentWrap").show();
    $(".refundWrap").hide();
    $(this).addClass("selectColor");
});

$(".subTitle").children().eq(2).on("click",function(){
    $(".detailContentWrap").hide();
    $(".reviewContentWrap").hide();
    $(".refundWrap").show();
});
*/


$(".subTitle>div").on("click",function(){
    $(".subTitle>div").removeClass("selectColor");
    const index = $(".subTitle>div").index(this);
    $(".subTitle>div").eq(index).addClass("selectColor");
    $(".prodContentMenu").hide();
    $(".prodContentMenu").eq(index).show();
    
});


$(".real-score").show();
const stars = $(".star-wrap>span");
stars.on("mouseover",function(){
    $(".real-score").hide();
    $(".show-score").show();
    const idx = stars.index(this);
    stars.each(function(index,item){
        if(idx>=index){
            $(item).css("color","gold");
        } else {
            $(item).css("color","lightgray");
        }
    });
    $(".show-score").text(idx+1);
});

stars.on("mouseleave",function(){
    $(".real-score").show();
    $(".show-score").hide();
    const realScore = Number($(".real-score").text());
    stars.each(function(index,item){
        if(realScore>index){
            $(item).css("color","gold");
        } else {
            $(item).css("color","lightgray");
        }
    });
});

stars.on("click",function(){
    const idx = stars.index(this);
    $(".real-score").text(idx+1);
});


$(".subTitle").children().eq(0).click();

