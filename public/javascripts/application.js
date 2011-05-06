$(document).ready(function() {
  // reorderable tables

  function reRank(event, ui) {
    rank = 0;
    $(".slide").each(function() {
      $(this).attr('rel', rank);
      rank++;
    });
  }

  function reRankAndUpdate(event, ui) {
    reRank(event, ui);

    data = { slides: [] };
    $(".slide").each(function() {
      data.slides.push({ id: parseInt($(this).attr('id')), rank: parseInt($(this).attr('rel')) });
    });

    url = window.location.pathname;
    $.ajax({
      url: url.substr(0, url.lastIndexOf('/slides')) + '/update_rank.json',
      type: 'post',
      data: data,
      success: function(data) {
        console.log(data);
      },
      failure: function() {
        console.log("fail");
      }
    });
  }

  $(".sortable tbody").sortable({
    create: reRank,
    stop: reRankAndUpdate
  });
});
