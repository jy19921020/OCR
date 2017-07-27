<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
		<title>产品序列号</title>
		<!-- 引入 WeUI -->
		<link rel="stylesheet" href="../static/css/weui.css">
		<link rel="stylesheet " href="../static/css/common.css ">
		<link rel="stylesheet " href="../static/css/style.css ">
        <link rel="stylesheet" type="text/css" href="../static/css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="../static/css/default.css">
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/cropper.css" rel="stylesheet">
        <link href="../static/css/main.css" rel="stylesheet">
		<style>

		</style>
	</head>

<body ontouchstart>
    <div class="ra_container">
        <div class="ra_main1">
            <img src="http://img02.tooopen.com/images/20150928/tooopen_sy_143912755726.jpg" style="height:240px;width: 100%;" />
        </div>
        <div class="weui-cells__title">产品序列号</div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd num_row">
				 <div class="input_num">
                    <input id="seqNo" class="weui-input product-input" type="text" placeholder="例如：Axhdjeebw">
					</div>
					<label class="photo" onchange="show()" id="label" for="inputImage">
                        <img src="../static/img/self.png"/>
                        <input class="sr-only" id="inputImage" name="file" type="file" accept="image/*" style="display:none">
                    </label>
                </div>
            </div>
        </div>
        <div class="ra_btn">
            <button>确定</button>
        </div>

        <!--选择图片
        <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file" onchange="show()" id="label">
            <input class="sr-only" id="inputImage" name="file" type="file" accept="image/*" style="display:none">选择图片
          
        </label>-->
    </div>
   
    <!--弹出裁剪框-->
    <div class="modal fade docs-cropped" id="getCroppedCanvasModal1" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                   
                </div>
                <div class="modal-body"></div>

                <div class="modal-footer">
                    
                </div>
            </div>
        </div>
    </div>
    <!--弹出裁剪好之后的图片-->
    <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" type="button" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="getCroppedCanvasTitle">Cropped</h4>
                </div>
                <div id="newimage" class="modal-body">
                <canvas id="newcanvas" ></canvas>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-primary" data-dismiss="modal" type="button" onclick="show1()">确定</button>
                </div>
            </div>
        </div>
    </div>
    <!--裁剪框style="display:none" aria-hidden="true"  src="assets/img/picture.jpg"-->
    <div class="row" id="cut"  style="display:none" >
        <div class="col-md-9">
            <div class="img-container">
                <img  alt="Picture">
            </div>
        </div> 
        <!--确定裁剪的按钮-->
        <button class="btn btn-primary" data-method="getCroppedCanvas" type="button" id="sure">
            <span class="docs-tooltip">
              
                确定
            </span>
        </button> 
        <button class="btn btn-primary" data-method="" type="button" id="cancelbtn" onclick="cancel()">
            <span class="docs-tooltip">
               
                取消
            </span>
        </button> 
    </div>
   
   

   
    <script src="../static/js/jquery.min.js"></script>
    <script src="../static/js/bootstrap.min.js"></script>
    <script src="../static/js/cropper.js"></script>
    <script src="../static/js/main.js"></script>

    <script>
        function show() {
            $("#cut").show();
            $(".ra_container").hide();
           // $("#label").hide();
        }
        function show1() {
            $(".ra_container").show();
            $("#cut").hide();
            uploadimage();

        }
        function cancel() {
            $(".ra_container").show();
            //$("#label").show();
            $("#cut").hide();
        }
        function uploadimage(){
        	var canvasobj = $("#newimage canvas")[0];
        	var newimage = canvasobj.toDataURL("image/png");
        	newimage = newimage.replace("data:image/png;base64,","");
        	 $.ajax({
                type: "POST",
                url: "http://139.196.34.172:8090/ocrservice",
               //url: "http://localhost:8080/upload",
                data: { image64str: newimage },
                cache: false,
                async:true, 
                success: function(data) {
                    
                    $("#seqNo").val(data.data.result);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("上传失败，请检查网络后重试");
                    
                }
            });
       }
    </script>
</body>
</html>