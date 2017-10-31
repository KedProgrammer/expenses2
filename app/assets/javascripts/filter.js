  $(document).ready(function(){
     class Filter{
    constructor(array){
      this.params = array
     
    $('.filter-type1').on('click', 'div' ,  this.filter_type)
    $('.filter-type2').on('click', 'div', this.filter_category)
    }

  prueba(){
             $.ajax({
  url: "/expenses?hola=" + this.params[0] , 
  context: document.body
        })
  }

  filter_type(){
    if ($(this).hasClass("active")){
      $(this).toggleClass("active");
      var params = [];
       params[0] = "prueba";
        let filter2 = new Filter(params)
    filter2.prueba()
      
    }else{
      $('.filter-type1 div').removeClass("active")
      $(this).addClass("active")
      var params = [];
        params[0] = " prueba";
         let filter2 = new Filter(params)
         filter2.prueba()
      }
    
      
  
  }


  filter_category(){
    if ($(this).hasClass("active")){
      $(this).toggleClass("active");
       
    }else{
      $('.filter-type2 div').removeClass("active")
      $(this).addClass("active")
      
    }
  
  }

}

let filter = new Filter




  })

 






