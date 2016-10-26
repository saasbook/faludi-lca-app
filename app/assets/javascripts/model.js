/* global $ */

function hide(id) {
	document.getElementById(id).style.visibility = 'hidden'
}

function show(id) {
	document.getElementById(id).style.visibility = 'visible'
}

function make_material_li(name) {
	var li = document.createElement("li");
	li.appendChild(document.createTextNode(name));
	li.setAttribute("class", "collection-item");

	var delButton = document.createElement("button");
	$(delButton).addClass("btn-flat").addClass("del-button");
	$(delButton).click(function() {$(li).remove()});
	delButton.appendChild(document.createTextNode("Remove"));
	li.appendChild(delButton);

	var procButton = document.createElement("button");
	$(procButton).addClass("btn-flat").addClass("proc-button");
	procButton.appendChild(document.createTextNode("+Process"));
	li.appendChild(procButton);

	return li;
}

function add_material() {
	var material = $('#material-select').val();
	var assembly = document.getElementById('assembly');
	var li = make_material_li(material);
	assembly.appendChild(li);
}

$(document).ready( function() {
	$('select').material_select();

	$('#material-select').change(function() {
		if ($(this).val() != null) {
			$('#material-add').css("background-color", "#696");
			$('#material-add').css("color", "white");
		} else {
			$('#material-add').css("background-color", "");
			$('#material-add').css("color", "");

			show_material_properties();
		}
	})
});