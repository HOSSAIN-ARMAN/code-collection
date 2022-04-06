
    <script>
        $(document).ready(function(){

            function empty(){
                $(".vori").val("");
                $(".ana").val("");
                $(".rotti").val("");
                $(".point").val("");
                $("._gold_price").val("");
                $('.vori-price').val("");
                $("#anaRottiPrice").val("");
                $('#rottiPointPrice').val("");
            }

            $('.cal').click(function (){

                $(".select_plus").hide();
                $(".select_min").hide();
                $(".rotti_to_weight").hide();
                $(".weight_to_rotti").hide();

                $(".cutBtn").click(function(){

                    empty();

                    $(".select_cut").show();
                    $(".select_plus").hide();
                    $(".select_min").hide();
                    $(".rotti_to_weight").hide();
                    $(".weight_to_rotti").hide();
                });

                $(".plusBtn").click(function(){

                    empty();

                    $(".select_cut").hide();
                    $(".select_min").hide();
                    $(".rotti_to_weight").hide();
                    $(".weight_to_rotti").hide();
                    $(".select_plus").show();
                });

                $(".minBtn").click(function(){

                    empty();

                    $(".select_cut").hide();
                    $(".select_min").show();
                    $(".select_plus").hide();
                    $(".rotti_to_weight").hide();
                    $(".weight_to_rotti").hide();
                });

                $(".rotti_to_weight_btn").click(function (){

                    empty();

                    $(".select_cut").hide();
                    $(".select_min").hide();
                    $(".select_plus").hide();
                    $(".rotti_to_weight").show();
                    $(".weight_to_rotti").hide();
                });

                $(".weight_to_rotti_btn").click(function (){

                    empty();

                    $(".select_cut").hide();
                    $(".select_min").hide();
                    $(".select_plus").hide();
                    $(".rotti_to_weight").hide();
                    $(".weight_to_rotti").show();
                });



                $("#myModal").modal();

                $('.vori--22, .ana--22, .rotti--22, .point--22, ._cut, ._gold_price').keyup(function (){

                    let p = 0;
                    let r = 0;
                    let a = 0;
                    let v = 0;
                    let price = 0;

                    let cut = Number($('._cut').val());
                    let goldPrice = parseInt($('._gold_price').val())
                    let vori22 = parseInt($('.vori--22').val());
                    let ana22  = parseInt($('.ana--22').val());
                    let rotti22 = parseInt($('.rotti--22').val());
                    let point22 = Number(0+"."+($('.point--22').val()));
                    // let totalRotti = vori22 * 8;
                    let totalRotti = vori22 * cut;
                    let totalGold = (vori22 * 96) + (ana22 * 6) + rotti22 + point22;
                    console.log(totalGold);
                    price = ( (goldPrice / 96) * ((96 - cut)/96) * totalGold );
                    console.log(price);
                    $('.vori-price').val(price);

                    let cutGold = (totalRotti * totalGold)/(vori22 * 96);
                    // $('._cut').val(cutGold);

                    let fixedCutGold  = Math.abs(cutGold.toFixed(1));

                    let beforFixedCutGold = fixedCutGold.toString().split(".")[0] ///before
                    let afterFixedCutGold =fixedCutGold.toString().split(".")[1] ///after

                    let cutRotti22 = beforFixedCutGold;
                    let range = beforFixedCutGold;
                    let cutAna22 = 0
                    let cutVori22 = 0;

                    for (let i = 0; i<range; i++){
                        if (cutRotti22 >=6){
                            cutRotti22 -= 6;
                            cutAna22 += 1;
                            if(cutAna22 > 16){
                                cutAna22 -= 16;
                                cutVori22 += 1;
                            }
                        }
                    }
                    // alert(cutAna22);
                    $('.cutPoint--22').val(afterFixedCutGold);
                    $('.cutRotti--22').val(cutRotti22);
                    $('.cutAna--22').val(cutAna22);
                    $('.cutVori--22').val(cutVori22);

                    p = Number(0+"."+($('.cutPoint--22').val()));
                    r = Number($('.cutRotti--22').val());
                    a = Number($('.cutAna--22').val());
                    v = Number($('.cutVori--22').val());

                    let afterCutTotalGold = ( v * 96) + ( a * 6) + r + p;
                    // console.log(afterCutTotalGold);
                    let newTotalGold = totalGold - afterCutTotalGold;
                    // console.log(newTotalGold);


                    let fCutGold  = newTotalGold.toFixed(1);
                    let befrFixedCutGold = fCutGold.toString().split(".")[0] ///before
                    let aftrFixedCutGold =fCutGold.toString().split(".")[1] ///after

                    let cutR = befrFixedCutGold;
                    let length = befrFixedCutGold;
                    let cutA = 0
                    let cutV = 0;

                    for (let j = 0; j<length; j++){
                        if (cutR >=6){
                            cutR -= 6;
                            cutA += 1;
                            if(cutA >= 16){
                                cutA -= 16;
                                cutV += 1;
                            }
                        }
                    }

                    $('#v-cut').val(cutV);
                    $('#a-cut').val(cutA);
                    $('#r-cut').val(cutR);
                    $('#p-cut').val(aftrFixedCutGold);
                });
            });

            $('.cal--close').click(function (){
                $('.vori--22').val("");
                $('.ana--22').val("");
                $('.rotti--22').val("");
                $('.point--22').val("");

                $('.cutPoint--22').val("");
                $('.cutRotti--22').val("");
                $('.cutAna--22').val("");
                $('.cutVori--22').val("");

                $('._cut').val("");
            })


            // ana&rotti cutting
            $('#anaCutting, #rottiCutting, #pointCutting, #cuttingAnaRotti, ._gold_price').keyup(function (){

                let price = 0;
                let cutValue = Number($('#cuttingAnaRotti').val());
                let goldPrice = parseInt($('._gold_price').val())
                let ana = Number($('#anaCutting').val());
                let rotti = Number($('#rottiCutting').val());
                let point = Number($('#pointCutting').val());

                let mainRotti = ((ana*6)+rotti)+"."+point;

                price = ( (goldPrice / 96) * ((96 - cutValue)/96) * mainRotti );
                $("#anaRottiPrice").val(price);

                let cutRotti = (cutValue/96) * mainRotti;
                // console.log(cutRotti);

                let remainigRotti = cutRotti.toFixed(1);

                let beforeFixedRemainigRotti = remainigRotti.toString().split(".")[0] ///before
                let afterFixedRemainigRotti = remainigRotti.toString().split(".")[1] ///before

                let range = beforeFixedRemainigRotti;
                let r = beforeFixedRemainigRotti;
                let a = 0;

                for(let j = 0; j<range; j++){
                    if (r >=6){
                        r -= 6;
                        a += 1;
                    }
                }
                $("#ana-cutting").val(a);
                $("#rotti-cutting").val(r);
                $("#point-cutting").val(afterFixedRemainigRotti);



                let totalRotti = mainRotti - cutRotti;
                // console.log(totalRotti);
                let fixedCutTotalRotti = totalRotti.toFixed(1);
                let beforeFixedTotalRotti = fixedCutTotalRotti.toString().split(".")[0] ///before
                let afterFixedTotalRotti = fixedCutTotalRotti.toString().split(".")[1] ///after

                let length = beforeFixedTotalRotti;
                let cutR = beforeFixedTotalRotti;
                let cutA = 0;

                for (let i = 0; i <length; i++){
                     if (cutR >=6){
                        cutR -= 6;
                        cutA += 1;
                    }
                }

                $("#a-cutting").val(cutA);
                $("#r-cutting").val(cutR);
                $("#p-cutting").val(afterFixedTotalRotti);

                // console.log(cutA +" "+cutR +" "+afterFixedTotalRotti);


            });

            // rotti cutting
            $('#cut-r, #cut-p, #cuttingRotti, ._gold_price').keyup(function (){
                let price = 0;
                let cutValue = $('#cuttingRotti').val();
                let goldPrice = parseInt($('._gold_price').val())
                let rotti = $('#cut-r').val();
                let point = $('#cut-p').val();
                let totalRotti = rotti+"."+point;

                price = ( (goldPrice / 96) * ((96 - cutValue)/96) * totalRotti );

                $('#rottiPointPrice').val(price);

                let cuttingRotti = (cutValue/96)*totalRotti;

                let cutFixedRotti = cuttingRotti.toFixed(1);
                let before = cutFixedRotti.toString().split(".")[0] ///before
                let after  = cutFixedRotti.toString().split(".")[1] ///after

                $("#cutting-r").val(before);
                $("#cutting-p").val(after);

                let finalRotti = totalRotti - cuttingRotti;
                let finalFiexd = finalRotti.toFixed(1);
                let beforeRotti = finalFiexd.toString().split(".")[0] ///before
                let afterRotti  = finalFiexd.toString().split(".")[1] ///after

                $("#remaining-r").val(beforeRotti);
                $("#remaining-p").val(afterRotti);

            });

            /*substraction section*/

            $('#plus-vori-p1, #plus-vori-p2, #plus-ana-p1, #plus-ana-p2, #plus-rotti-p1, #plus-rotti-p2, #plus-point-p1, #plus-point-p2').keyup(function (){


                let voriP1 =  Number($('#plus-vori-p1').val());
                let voriP2 =  Number($('#plus-vori-p2').val());

                let anaP1   = Number($('#plus-ana-p1').val());
                let anaP2   = Number($('#plus-ana-p2').val());

                let rottiP1 = Number($('#plus-rotti-p1').val());
                let rottiP2 = Number($('#plus-rotti-p2').val());

                let pointP1 = Number($('#plus-point-p1').val());
                let pointP2 = Number($('#plus-point-p2').val());


                let sumPoint = pointP1 + pointP2;
                let remaPoint = 0;
                let remaRotti = 0;

                if (sumPoint >= 10){
                    remaPoint = sumPoint - 10;
                    remaRotti = 1;
                }else {
                    remaPoint = sumPoint;
                }
                $('#plus-point-p3').val(remaPoint);
                $('#plus-rotti-p3').val(remaRotti);

                let sumRotti = rottiP1 + rottiP2 + remaRotti;
                let remaAna = 0;

                if (sumRotti >= 6){
                    remaRotti = sumRotti - 6;
                    remaAna = 1;
                }else {
                    remaRotti = sumRotti;
                }
                $('#plus-rotti-p3').val(remaRotti);
                $('#plus-ana-p3').val(remaAna);

                let sumAna = anaP1 + anaP2 + remaAna;
                let remaVori = 0;
                if (sumAna >= 16){
                    remaAna = sumAna - 16;
                    remaVori = 1;
                }else {
                    remaAna = sumAna;
                }
                $('#plus-ana-p3').val(remaAna);
                $('#plus-vori-p3').val(remaVori);

                let sumVori = voriP1 + voriP2 + remaVori;

                $('#plus-vori-p3').val(sumVori);

            });

            /*min section*/

            $('#min-vori-p1, #min-vori-p2, #min-ana-p1, #min-ana-p2, #min-rotti-p1, #min-rotti-p2, #min-point-p1, #min-point-p2').keyup(function (){

                var m_voriP1 =  Number($('#min-vori-p1').val());
                var m_voriP2 =  Number($('#min-vori-p2').val());

                var m_anaP1   = Number($('#min-ana-p1').val());
                var m_anaP2   = Number($('#min-ana-p2').val());

                var m_rottiP1 = Number($('#min-rotti-p1').val());
                var m_rottiP2 = Number($('#min-rotti-p2').val());

                // var m_pointP1 = Number(0+"."+($('.min-point-p1').val()));
                // var m_pointP2 = Number(0+"."+($('.min-point-p2').val()));

                var m_pointP1 = Number(($('#min-point-p1').val()));
                var m_pointP2 = Number(($('#min-point-p2').val()));

                var minTotalP1Gold = ((m_voriP1 * 96) + (m_anaP1 * 6) + m_rottiP1)+"."+m_pointP1;
                var minTotalP2Gold = ((m_voriP2 * 96) + (m_anaP2 * 6) + m_rottiP2)+"."+m_pointP2;

                console.log(minTotalP1Gold);
                console.log(minTotalP2Gold);

                var totalminGold = Math.abs(minTotalP1Gold - minTotalP2Gold);


                console.log(totalminGold);

                let mainGold  = totalminGold.toFixed(1)


                let beforMinGold = mainGold.toString().split(".")[0] ///before
                let afterMinGold = mainGold.toString().split(".")[1] ///after



                let minRotti = beforMinGold;
                let range = beforMinGold;
                let minAna = 0
                let minVori = 0;

                for (let i = 0; i<range; i++){
                    if (minRotti >= 6){
                        minRotti -= 6;
                        minAna += 1;
                        if(minAna >= 16){
                            minAna -= 16;
                            minVori += 1;
                        }
                    }
                }

                $('#min-vori-p3').val(minVori);
                $('#min-ana-p3').val(minAna);
                $('#min-rotti-p3').val(minRotti);
                $('#min-point-p3').val(afterMinGold);
                // $('#min-point-p3').val(Math.abs((m_pointP1 - m_pointP2)));

            });

            /*rotti-to-weight*/

            $('#total_rotti').keyup(function (){

                let totalRotti = $('#total_rotti').val();

                let beforMinGold = totalRotti.toString().split(".")[0] ///before
                let afterMinGold = totalRotti.toString().split(".")[1] ///after

                let minRotti = beforMinGold;
                let range = beforMinGold;
                let minAna = 0
                let minVori = 0;

                for (let i = 0; i<range; i++){
                    if (minRotti >=6){
                        minRotti -= 6;
                        minAna += 1;
                        if(minAna >= 16){
                            minAna -= 16;
                            minVori += 1;
                        }
                    }
                }

                $('.rotti_to_vori').val(minVori);
                $('.rotti_to_ana').val(minAna);
                $('.rotti_to_rotti').val(minRotti);
                $('.rotti_to_point').val(afterMinGold);

            })

            /*weight-to-rotti*/

            $('.weight_to_vori, .weight_to_ana, #weight_to_rotti, .weight_to_point').keyup(function (){


                let weight_to_vori =  Number($('.weight_to_vori').val());

                let weight_to_ana   = Number($('.weight_to_ana').val());

                let weight_to_rotti = Number($('#weight_to_rotti').val());

                let weight_to_point = Number(($('.weight_to_point').val()));

                let total = (weight_to_vori * 96) + (weight_to_ana * 6) + weight_to_rotti;

                console.log(total);

                let amountOfRotti = total+"."+weight_to_point;

                $('#get_rotti').val(amountOfRotti);

            });

        });
    </script>
