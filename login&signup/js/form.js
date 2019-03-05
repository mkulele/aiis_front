$(function() {
    $("#alert-email").hide();
    $("#alert-tel").hide();
    $("#alert-name").hide();
    $("#alert-pwd").hide();
    $('#alert-success').hide();
    $('#alert-danger').hide();
    $('#done').hide();


    $("input").keyup(function () {
        var email = $("#email").val();
        var passwd = $("#pwd").val();
        var passwd2 = $("#pwd_confirm").val();
        var name = $("#name").val();
        var tel = $("#tel").val();

        if(email=="" || passwd=="" || passwd2=="" || name=="" || tel=="") {
            $(".input_email").keyup(function () {
                email = $("#email").val();
                if (email == "") {
                    $("#alert-email").show();
                    $('#done').hide();
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $("#alert-email").hide();

                }
            });

            $(".input_passwd").keyup(function () {
                passwd = $("#pwd").val();
                if (passwd == "") {
                    $("#alert-pwd").show();
                    $('#done').hide();
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $("#alert-pwd").hide();
                }
            });

            $(".input_passwd2").keyup(function () {
                passwd2 = $("#pwd_confirm").val();
                if (passwd2 == "") {
                    $("#alert-pwd").show();
                    $('#done').hide();
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $("#alert-pwd").hide();
                }
            });

            $(".input_name").keyup(function () {
                name = $("#name").val();
                if (name == "") {
                    $("#alert-name").show();
                    $('#done').hide();
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $("#alert-name").hide();
                }
            });

            $(".input_tel").keyup(function () {
                tel = $("#tel").val();
                if (tel == "") {
                    $("#alert-tel").show();
                    $('#done').hide();
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $("#alert-tel").hide();
                }
            });
        }else{
            $(function(){
                $("#alert-success").hide();
                $("#alert-danger").hide();
                passwd = $("#pwd").val();
                passwd2=$("#pwd_confirm").val();
                if(passwd != "" || passwd2 != ""){
                    if(passwd == passwd2){
                        $("#alert-success").show();
                        $("#alert-danger").hide();
                        $('#nope').hide();
                        $('#done').show();
                        $("#submit").removeAttr("disabled");
                    }else{
                        $("#alert-success").hide();
                        $("#alert-danger").show();
                        $('#done').hide();
                        $("#submit").attr("disabled", "disabled");

                        $('.login').on('submit', function(e) {
                            e.preventDefault();
                            if (working) return;
                            var $this = $(this),
                                $state = $this.find('button > .state');
                            $this.addClass('loading');
                            $state.html('Authenticating');
                        });


                    }
                }

            });

        }
    });
});