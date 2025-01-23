// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
import "@hotwired/turbo-rails"
import "controllers"

$(document).on('turbo:load', function(e) {
    hideShowAddress();
})

function hideShowAddress() {
    $("#address_details").on('change', function(e) {
        // toggleclass alterar em colocar ou remover o parametro d-none
        // se tiver d-none, é removido senão eu colocado
        $('.address-details-div').toggleClass("d-none")

        if($("lbl_show_hide").text() == "Hide Address Details")
            $("lbl_show_hide").text("Show Address Details")
        else
            $("lbl_show_hide").text("Hide Address Details")
    });
}