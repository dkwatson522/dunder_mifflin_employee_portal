// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect() {
    this.outputTarget.textContent = 'Hello, Stimulus!'
  }
}

String.prototype.getInitials = function(glue){
    if (typeof glue == "undefined") {
        var glue = true;
    }

    var initials = this.replace(/[^a-zA-Z- ]/g, "").match(/\b\w/g);

    if (glue) {
        return initials.join('');
    }

    return  initials;
};

String.prototype.capitalize = function(){
    return this.toLowerCase().replace( /\b\w/g, function (m) {
        return m.toUpperCase();
    });
};
