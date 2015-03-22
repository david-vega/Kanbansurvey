/**
 * @parent dom
 * @download http://jmvcsite.heroku.com/pluginify?plugins[]=jquery/dom/form_params/form_params.js
 * @plugin jquery/dom/form_params
 * @test jquery/dom/form_params/qunit.html
 *
 * Returns an object of name-value pairs that represents values in a form.
 * It is able to nest values whose element's name has square brackets.
 *
 * When convert is set to true strings that represent numbers and booleans will
 * be converted and empty string will not be added to the object.
 *
 * Example html:
 * @codestart html
 * &lt;form>
 *   &lt;input name="foo[bar]" value='2'/>
 *   &lt;input name="foo[ced]" value='4'/>
 * &lt;form/>
 * @codeend
 * Example code:
 *
 *     $('form').formParams() //-> { foo:{bar:'2', ced: '4'} }
 *
 *
 * @demo jquery/dom/form_params/form_params.html
 *
 * @param {Object} [params] If an object is passed, the form will be repopulated
 * with the values of the object based on the name of the inputs within
 * the form
 * @param {Boolean} [convert=false] True if strings that look like numbers
 * and booleans should be converted and if empty string should not be added
 * to the result. Defaults to false.
 * @return {Object} An object of name-value pairs.
 */
(function(g){var i=/radio|checkbox/i,j=/[^\[\]]+/g,k=/^[\-+]?[0-9]*\.?[0-9]+([eE][\-+]?[0-9]+)?$/,l=function(b){if(typeof b=="number")return true;if(typeof b!="string")return false;return b.match(k)};g.fn.extend({formParams:function(b,d){if(!!b===b){d=b;b=null}if(b)return this.setParams(b);else if(this[0].nodeName.toLowerCase()=="form"&&this[0].elements)return jQuery(jQuery.makeArray(this[0].elements)).getParams(d);return jQuery("input[name], textarea[name], select[name]",this[0]).getParams(d)},setParams:function(b){this.find("[name]").each(function(){var d=
    b[g(this).attr("name")],a;if(d!==undefined){a=g(this);if(a.is(":radio"))a.val()==d&&a.attr("checked",true);else if(a.is(":checkbox")){d=g.isArray(d)?d:[d];g.inArray(a.val(),d)>-1&&a.attr("checked",true)}else a.val(d)}})},getParams:function(b){var d={},a;b=b===undefined?false:b;this.each(function(){var e=this;if(!((e.type&&e.type.toLowerCase())=="submit"||!e.name)){var c=e.name,f=g.data(e,"value")||g.fn.val.call([e]),h=i.test(e.type);c=c.match(j);e=!h||!!e.checked;if(b){if(l(f))f=parseFloat(f);else if(f===
    "true")f=true;else if(f==="false")f=false;if(f==="")f=undefined}a=d;for(h=0;h<c.length-1;h++){a[c[h]]||(a[c[h]]={});a=a[c[h]]}c=c[c.length-1];if(a[c]){g.isArray(a[c])||(a[c]=a[c]===undefined?[]:[a[c]]);e&&a[c].push(f)}else if(e||!a[c])a[c]=e?f:undefined}});return d}})})(jQuery);
