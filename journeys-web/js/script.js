function playVideos() {
	var playlist = _.map(videosJSON, function(videoJSON) {
		var playlistEntryJSON = {containment:'body', autoPlay:true, mute:true, opacity:1, realfullscreen:true, loop:true, showControls:false, showYTLogo:false, stopMovieOnBlur:false, optimizeDisplay:true, quality:"highres"};
		return _.extend(playlistEntryJSON, videoJSON);
	});
	$(".player").YTPlaylist(playlist, true);

	var init = false;
	$(".player").on("YTPStart", function(e) {
		if (init)
		{
			return;
		}
		init = true;
	});
}

$().ready(function () {
	playVideos();
});