
    // Enable pusher logging - don't include this in production
    Pusher.log = function(message) {
      if (window.console && window.console.log) {
        window.console.log(message);
      }
    };

    var pusher = new Pusher('a7d4ef9bdf62f6be328a');
    var channel = pusher.subscribe('beardstagram');
    channel.bind('my_event', function(data) {
      alert(data.message);
    });
