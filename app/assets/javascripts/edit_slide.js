function element(response){
  this.after_tag = response.type.after_tag;
  this.before_tag = response.type.before_tag;
  this.element_id = response.element.id;
};

function draggable(){
  $( ".draggable" ).draggable({
      containment: "parent",
      grid: [ 20,20 ],
      stop : function(){
        save(this);
      }
    }).resizable({
    containment: "parent",
    grid: [ 20,20 ],
    stop : function(){
      save(this);
    }
  });
};

function editable(){
  $('.editable').editable();
    var $editArea = jQuery('.editable-area');
    $editArea.find('.editable')
      .editable({ callback: function(event){
     save(event.$el.parent());
    }});
};

function save(slideElement){
  var width = $(slideElement).css('width');
  var heigth = $(slideElement).css('height');
  var top = $(slideElement).css('top');
  var left = $(slideElement).css('left');
  var id = $(slideElement).attr('id');
  var editableSlide = $(slideElement).find('.editable');
  var content = editableSlide.html();
  var url = '/elements/ajax/' + id;
  $.post(url, {element: {id: id, width: width, heigth: heigth, top: top, left: left, content: content}}, function(response){
    console.log(response)
  })
};

element.prototype.generate_html = function(){
  return "<div class='slide-object draggable editable-area' id='" + this.element_id + "'><div class='editable'>" + "edit this" + "</div></div>"
};

function setup(){

  draggable();
  editable();

  $('a.add-element').on('click',function(e){
    e.preventDefault();
    url = $(this).attr('href');
    $.get(url,function(response){
      var new_element = new element(response);
      console.log(new_element.generate_html())
      $('.slide').append(new_element.generate_html());
      draggable();
      // editable();
    }, 'json');
  })


  $('#colorpicker').farbtastic('.slide');

};


$(document).ready(setup);
$(document).on("page:load",setup);
