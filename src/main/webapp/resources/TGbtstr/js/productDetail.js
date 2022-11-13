
const price = $(".hiddenPrice").val();
let cpa = $(".changeProductAmount");
let sumPrice = $(".sumPrice").val();

$("#minus").on("click",function(){
    const Qty = $(this).next();
    const buyQty = Qty.text();
    if(buyQty == 1){
     	alert("돌아가");
    	return;
    }
    const minusQty = Number(buyQty)-1;
    cpa.val(minusQty);
    Qty.text(minusQty);
    const amount = Qty.text(minusQty);
    sumPrice = price * minusQty;
    console.log(price,minusQty);
	$(".sumPrice").val(sumPrice);
    
});

$("#plus").on("click",function(){
    const Qty = $(this).prev();
    const buyQty = Qty.text();
    if(buyQty == 10){
     	alert("그만 사");
    	return;
    }
    const plusQty = Number(buyQty)+1;
    cpa.val(plusQty);
    Qty.text(plusQty);
    const amount = Qty.text(plusQty);
    sumPrice = price * plusQty;
    console.log(price,plusQty);
	$(".sumPrice").val(sumPrice);
    
});


$(".subTitle>div").on("click",function(){
    $(".subTitle>div").removeClass("selectColor");
    const index = $(".subTitle>div").index(this);
    $(".subTitle>div").eq(index).addClass("selectColor");
    $(".subTitle>div>button").removeClass("selectColor");
    if(index == 1){
    	$(".subTitle>div>button").addClass("selectColor");
    }
    $(".prodContentMenu").hide();
    $(".prodContentMenu").eq(index).show();
});
$(".subTitle>div>button").on("click",function(){
	$(".subTitle>div>button").addClass("selectColor");
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
    $("#reviewScore").val(idx+1);
});


$(".subTitle").children().eq(0).click();


