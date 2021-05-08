window.addEventListener('load', function(){
  // 詳細検索
  const searchBtn   = document.getElementById("search-btn")
  const visibleTrue = document.getElementById("detail-search-area")
  const searchArea  = document.getElementById("search")
  // 新規投稿
  const newTipArea  = document.getElementById("new-tip")
  const newTipBtn   = document.getElementById("new-tip-btn")
  // 質問する
  const newQuestionArea = document.getElementById("new-question")
  const newQuestionBtn  = document.getElementById("new-question-btn")
  // マイページ
  const myPageArea = document.getElementById("my-page")
  const myPageBtn  = document.getElementById("my-page-btn")
  
  // 詳細検索
  searchBtn.addEventListener('mouseover', function(){
    searchArea.setAttribute("style", "background-color:rgb(230, 230, 230);")
  })
  searchBtn.addEventListener('mouseout', function(){
    if (visibleTrue.getAttribute("style") != "display:block;"){
      searchArea.removeAttribute("style", "background-color:rgb(230, 230, 230);")
    }
  })
  searchBtn.addEventListener('click', function(){
    if (visibleTrue.getAttribute("style") == "display:block;"){
      visibleTrue.removeAttribute("style", "display:block;")
      searchArea.removeAttribute("style", "background-color:rgb(230, 230, 230);")
    }else{
      visibleTrue.setAttribute("style", "display:block;")
      searchArea.setAttribute("style", "background-color:rgb(230, 230, 230);")
    }
  })
  // 新規投稿
  newTipBtn.addEventListener('mouseover', function(){
    newTipArea.setAttribute("style", "background-color:rgb(230, 230, 230);")
  })
  newTipBtn.addEventListener("mouseout", function(){
    newTipArea.removeAttribute("style", "background-color:rgb(230, 230, 230);")
  })
  // 質問する
  newQuestionBtn.addEventListener('mouseover', function(){
    newQuestionArea.setAttribute("style", "background-color:rgb(230, 230, 230);")
  })
  newQuestionBtn.addEventListener("mouseout", function(){
    newQuestionArea.removeAttribute("style", "background-color:rgb(230, 230, 230);")
  })
  // マイページ
  myPageBtn.addEventListener('mouseover', function(){
    myPageArea.setAttribute("style", "background-color:rgb(230, 230, 230);")
  })
  myPageBtn.addEventListener("mouseout", function(){
    myPageArea.removeAttribute("style", "background-color:rgb(230, 230, 230);")
  })
})