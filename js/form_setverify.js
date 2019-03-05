$(function() {
    $("#alert-code").hide();
   $("input").keyup(function () {
                var code = $("#code").val();
                if (code == "") {
                    $("#alert-code").show();
                    $("#submit").attr("disabled", "disabled");
                } else {
                    $("#alert-code").hide();
                    $("#submit").removeAttr("disabled");
                    $('.login').on('submit', function(e) {
                        e.preventDefault();
                        if (working) return;
                        var $this = $(this),
                            $state = $this.find('button > .state');
                        $this.addClass('loading');
                        $state.html('Authenticating');
                    });

                }
            });
});