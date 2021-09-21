// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require materialize

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "materialize-css/dist/js/materialize";
import "channels";
Rails.start();
Turbolinks.start();
ActiveStorage.start();

$(document).on("turbolinks:load", () => {
  $(".dropdown-trigger").dropdown();
  $(".sidenav").sidenav();
  $("#fade-target").fadeOut(5000);
});
