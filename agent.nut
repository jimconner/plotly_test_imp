// Agent Code
#require "Plotly.class.nut:1.0.0"

function postToPlotly(reading) {
    local timestamp = plot1.getPlotlyTimestamp();
    server.log(reading["temp"]);
    plot1.post([
        {
            "name" : "Temperature",
            "x" : [timestamp],
            "y" : [reading["temp"]]
        }
    ]);
}


plot1 <- Plotly("your_plotly_username", "your_plotly_api_key", "TestPlotly", true, ["Temperature"], function(error, response, decoded) {
    device.on("reading", postToPlotly);
    server.log("See plot at " + plot1.getUrl());
    server.log(response);
    server.log(error);
    server.log(decoded);
});

